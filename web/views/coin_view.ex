defmodule Cryptofolio.CoinView do
  use Cryptofolio.Web, :view

  def render("index.json", %{coins: coins}) do
    render_many(coins, Cryptofolio.CoinView, "show.json")
  end

  def render("show.json", %{coin: coin}) do
    %{coin: render_one(coin, Cryptofolio.CoinView, "coin.json")}
  end

  def render("coin.json", %{coin: coin}) do
    %{id: coin.id,
      name: coin.name,
      symbol: coin.symbol}
  end
end
