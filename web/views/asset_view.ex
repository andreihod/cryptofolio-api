defmodule Cryptofolio.AssetView do
  use Cryptofolio.Web, :view

  def render("index.json", %{assets: assets}) do
    render_many(assets, Cryptofolio.AssetView, "show.json")
  end

  def render("show.json", %{asset: asset}) do
    %{asset: render_one(asset, Cryptofolio.AssetView, "asset.json")}
  end

  def render("asset.json", %{asset: asset}) do
    %{id: asset.id,
      mybalance: asset.mybalance,
      inserted_at: asset.inserted_at,
      updated_at: asset.updated_at,
      exchange: render_one(asset.exchange, Cryptofolio.ExchangeView, "exchange.json"),
      coin: render_one(asset.coin, Cryptofolio.CoinView, "coin.json")}
  end
end
