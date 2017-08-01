defmodule Cryptofolio.CoinController do
  use Cryptofolio.Web, :controller

  alias Cryptofolio.Coin
  alias Cryptofolio.Exchange

  def index(conn, _params) do
    coins = Repo.all(Coin)
    render(conn, "index.json", coins: coins)
  end

  def show(conn, %{"id" => id}) do
    coin = Repo.get!(Coin, id)
    render(conn, "show.json", coin: coin)
  end

  def exchanges(conn, %{"id" => id}) do
    coin = Repo.get!(Coin, id)
    exchanges = queryCoinExchanges(coin)
    render(conn, Cryptofolio.ExchangeView, "index.json", exchanges: exchanges)
  end

  defp queryCoinExchanges(%{"symbol": symbol}) do
    query = from e in Exchange,
            where: e.market_from == ^symbol
            or e.market_to == ^symbol
    Repo.all(query)
  end

end
