defmodule Cryptofolio.AssetControllerTest do
  use Cryptofolio.ConnCase

  alias Cryptofolio.Asset
  @valid_attrs %{mybalance: "120.5"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  # TO-DO tests

end
