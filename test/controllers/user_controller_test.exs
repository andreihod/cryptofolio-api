defmodule Cryptofolio.UserControllerTest do
  use Cryptofolio.ConnCase

  alias Cryptofolio.User
  @valid_attrs %{email: "test@gmail.com", password: "hello123", username: "testuser"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  # TO-DO create new tests

end
