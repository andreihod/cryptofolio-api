defmodule Cryptofolio.ExchangeController do
  use Cryptofolio.Web, :controller
  # uncomment if authentication becomes required
  # plug Guardian.Plug.EnsureAuthenticated, handler: Cryptofolio.AuthController

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

end
