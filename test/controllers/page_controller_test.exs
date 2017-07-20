defmodule Cryptofolio.PageControllerTest do
  use Cryptofolio.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "zeca.jpg"
  end
end
