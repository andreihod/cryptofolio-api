defmodule Cryptofolio.CoinController do
  use Cryptofolio.Web, :controller

  alias Cryptofolio.Coin

  def index(conn, _params) do
    coins = Repo.all(Coin)
    render(conn, "index.json", coins: coins)
  end

  def show(conn, %{"id" => id}) do
    coin = Repo.get!(Coin, id)
    render(conn, "show.json", coin: coin)
  end

end
