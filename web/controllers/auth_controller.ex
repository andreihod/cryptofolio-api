defmodule Cryptofolio.AuthController do
  use Cryptofolio.Web, :controller

  alias Cryptofolio.User
  alias Comeonin.Bcrypt

  def signup(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", user_path(conn, :me))
        |> render("show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Cryptofolio.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def login(conn, %{"user" => user_params}) do
    IO.inspect(user_params)
    case find_and_confirm_password(user_params) do
      {:ok, user} ->
         new_conn = Guardian.Plug.api_sign_in(conn, user)
         jwt = Guardian.Plug.current_token(new_conn)
         {:ok, claims} = Guardian.Plug.claims(new_conn)
         %{"exp" => exp} = claims

         new_conn
         |> put_resp_header("authorization", "Bearer #{jwt}")
         |> put_resp_header("x-expires", "#{exp}")
         |> render("login.json", user: user, jwt: jwt, exp: exp)
      {:error, _error} ->
        conn
        |> put_status(401)
        |> render("message.json", message: "Incorrect user or password")
    end
  end

  #TO-DO Logout
  def logout(conn, _params) do
    jwt = Guardian.Plug.current_token(conn)
    claims = Guardian.Plug.claims(conn)
    Guardian.revoke!(jwt, claims)
    render "message.json", message: "Bye"
  end

  defp find_and_confirm_password(%{"password" => password, "username_or_email" => login}) do
    query = from u in User,
          where: u.username == ^login or u.email == ^login,
          select: u
    user = Repo.all(query)
    |> Enum.find(fn(u) -> Bcrypt.checkpw(password, u.encrypted_password) end)
    case user do
      %Cryptofolio.User{} -> {:ok, user}
      nil -> {:error, nil}
    end
  end

end
