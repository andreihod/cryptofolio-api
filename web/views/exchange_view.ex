defmodule Cryptofolio.ExchangeView do
  use Cryptofolio.Web, :view

  def render("index.json", %{exchanges: exchanges}) do
    render_many(exchanges, Cryptofolio.ExchangeView, "show.json")
  end

  def render("show.json", %{exchange: exchange}) do
    %{exchange: render_one(exchange, Cryptofolio.ExchangeView, "exchange.json")}
  end

  def render("exchange.json", %{exchange: exchange}) do
    %{id: exchange.id,
      name: exchange.name,
      market: render_one(exchange, Cryptofolio.ExchangeView, "market.json"),
      price: exchange.price}
  end

  def render("market.json", %{exchange: exchange}) do
    %{currencyFrom: exchange.market_from,
      currencyTo: exchange.market_to}
  end

end
