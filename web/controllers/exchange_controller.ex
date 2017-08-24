defmodule Cryptofolio.ExchangeController do
  use Cryptofolio.Web, :controller

  import Ecto.Type
  alias Cryptofolio.Exchange

  def index(conn, _params) do
    exchanges = Repo.all(Exchange)
    render(conn, "index.json", exchanges: exchanges)
  end

  def create(conn, %{"exchange" => exchange_params}) do
    changeset = Exchange.changeset(%Exchange{}, exchange_params)

    case Repo.insert(changeset) do
      {:ok, exchange} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", exchange_path(conn, :show, exchange))
        |> render("show.json", exchange: exchange)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Cryptofolio.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    exchange = Repo.get!(Exchange, id)
    render(conn, "show.json", exchange: exchange)
  end

  def find_one(from, to, name) do
    query_exchange = from e in Exchange,
      where: e.market_from == ^from and e.market_to == ^to and e.name == ^name

    case Repo.one(query_exchange) do
      nil -> {:not_supported, nil}
      exchange -> {:supported, exchange}
    end
  end

  def refresh(exchange, last_price) do
    {:ok, decimal_price} = cast(:decimal, Decimal.new(last_price))
    exchange = Ecto.Changeset.change exchange, price: decimal_price
    Repo.update exchange
  end

end
