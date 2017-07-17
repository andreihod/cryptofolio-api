defmodule Cryptofolio.AuthView do
  use Cryptofolio.Web, :view

  def render("show.json", %{user: user}) do
    %{user: render_one(user, Cryptofolio.UserView, "user.json")}
  end

  def render("login.json", %{user: user, jwt: jwt, exp: exp}) do
    %{
        user: render_one(user, Cryptofolio.UserView, "user.json"),
        jwt: jwt,
        exp: exp
      }
  end

  def render("message.json", %{message: message}) do
    %{message: message}
  end

end
