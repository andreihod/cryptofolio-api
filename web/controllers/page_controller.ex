defmodule Cryptofolio.PageController do
  use Cryptofolio.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
