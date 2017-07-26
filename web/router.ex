defmodule Cryptofolio.Router do
  use Cryptofolio.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api_auth do
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", Cryptofolio do
     pipe_through [:api, :api_auth]

     post "/auth/signup", AuthController, :signup
     post "/auth/login", AuthController, :login
     post "/auth/logout", AuthController, :logout

     get "/users/me", UserController, :me
     put "/users/me", UserController, :update

  end
end
