defmodule Cryptofolio.Poloniex do
  use GenServer

  alias Cryptofolio.ExchangeController

  @poloniex_ticker_url "https://poloniex.com/public?command=returnTicker"

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work() # Schedule work to be performed at some point
    {:ok, state}
  end

  def handle_info(:work, state) do
    get_markets()
    |> record_prices()

    schedule_work() # Reschedule once more
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 15 * 1000) # In 15 seconds
  end

  defp get_markets() do
    HTTPoison.start
    %HTTPoison.Response{"body": body} = HTTPoison.get! @poloniex_ticker_url
    Poison.decode! body
  end

  defp record_prices(markets) do
    Enum.each(markets, &(find_exchange(&1)))
  end

  defp find_exchange(market) do
    {symbols , %{"last" => last_price}} = market
    [from, to] = Regex.split(~r{_}, symbols)

    case ExchangeController.find_one(from, to, "Poloniex") do
      {:not_supported, _} -> nil
      {:supported, exchange} -> ExchangeController.refresh(exchange, last_price)
    end
  end

end
