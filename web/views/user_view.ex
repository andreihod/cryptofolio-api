defmodule Cryptofolio.UserView do
  use Cryptofolio.Web, :view

  def render("show.json", %{user: user}) do
    %{user: render_one(user, Cryptofolio.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      email: user.email}
  end
end
