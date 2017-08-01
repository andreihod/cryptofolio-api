defmodule Cryptofolio.ExchangeControllerTest do
  use Cryptofolio.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, exchange_path(conn, :index)
    assert json_response(conn, 200) == []
  end

end
