# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cryptofolio.Repo.insert!(%Cryptofolio.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Cryptofolio.Repo
alias Cryptofolio.Exchange

Repo.delete_all(Exchange)

Repo.insert! %Exchange{
  id: 1,
  name: "Poloniex",
  market_from: "BTC",
  market_to: "USD"
}

Repo.insert! %Exchange{
  id: 2,
  name: "Poloniex",
  market_from: "BTC",
  market_to: "EUR"
}

Repo.insert! %Exchange{
  id: 3,
  name: "Poloniex",
  market_from: "BTC",
  market_to: "ETH"
}
