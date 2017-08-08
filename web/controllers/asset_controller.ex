defmodule Cryptofolio.AssetController do
  use Cryptofolio.Web, :controller

  plug Guardian.Plug.EnsureAuthenticated, handler: Cryptofolio.AuthController

  alias Cryptofolio.Asset

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    query = from a in Asset,
            where: a.user_id == ^user.id,
            preload: [:exchange, :coin]
    assets = Repo.all(query)
    render(conn, "index.json", assets: assets)
  end

  def create(conn, %{"asset" => asset_params}) do
    user = Guardian.Plug.current_resource(conn)
    new_asset = build_assoc(user, :assets)
    asset_params = load_assocs_ids(asset_params)
    changeset = Asset.changeset(new_asset, asset_params)

    case Repo.insert(changeset) do
      {:ok, asset} ->
        asset = Repo.preload(asset, [:exchange, :coin])
        conn
        |> put_status(:created)
        |> render("show.json", asset: asset)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Cryptofolio.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)
    query = from a in Asset,
            where: a.user_id == ^user.id and
                   a.id == ^id,
            preload: [:exchange, :coin]
    asset = Repo.one(query)
    render(conn, "show.json", asset: asset)
  end

  def update(conn, %{"id" => id, "asset" => asset_params}) do
    user = Guardian.Plug.current_resource(conn)
    asset = Repo.get!(Asset, id)
    asset_params = load_assocs_ids(asset_params)
    changeset = Asset.changeset(asset, asset_params)

    case Repo.update(changeset) do
      {:ok, asset} ->
        asset = Repo.preload(asset, [:exchange, :coin])
        render(conn, "show.json", asset: asset)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Cryptofolio.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)
    query = from a in Asset,
            where: a.user_id == ^user.id and
                   a.id == ^id
    asset = Repo.one!(query)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(asset)

    send_resp(conn, :no_content, "")
  end

  defp load_assocs_ids(asset_params) do
    %{"coin" => coin, "exchange" => exchange} = asset_params
    asset_params
    |> Map.put("coin_id", coin["id"])
    |> Map.put("exchange_id", exchange["id"])
  end

end
