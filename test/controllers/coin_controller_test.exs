defmodule Cryptofolio.CoinControllerTest do
  use Cryptofolio.ConnCase

  alias Cryptofolio.Coin
  @valid_attrs %{name: "Bitcoin", symbol: "BTC"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "shows chosen resource", %{conn: conn} do
    coin = Repo.insert! %Coin{}
    conn = get conn, coin_path(conn, :show, coin)
    assert json_response(conn, 200)["coin"] == %{"id" => coin.id,
      "name" => coin.name,
      "symbol" => coin.symbol}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, coin_path(conn, :show, -1)
    end
  end
end
