defmodule Cryptofolio.ExchangeTest do
  use Cryptofolio.ModelCase

  alias Cryptofolio.Exchange

  @valid_attrs %{market_from: "BTC", market_to: "USD", name: "Poloniex", price: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Exchange.changeset(%Exchange{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Exchange.changeset(%Exchange{}, @invalid_attrs)
    refute changeset.valid?
  end
end
