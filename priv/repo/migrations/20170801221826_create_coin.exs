defmodule Cryptofolio.Repo.Migrations.CreateCoin do
  use Ecto.Migration
  alias Cryptofolio.Repo
  alias Cryptofolio.Exchange
  alias Cryptofolio.Coin

  def change do
    create table(:coins) do
      add :name, :string
      add :symbol, :string

      timestamps()
    end

    create unique_index(:coins, [:name])
    create unique_index(:coins, [:symbol])

    Repo.insert! %Coin{
      id: 1,
      name: "Bitcoin",
      symbol: "BTC"
    }

    Repo.insert! %Coin{
      id: 2,
      name: "Ethereum",
      symbol: "ETH"
    }

    Repo.insert! %Exchange{
      id: 1,
      name: "Poloniex",
      market_from: "BTC",
      market_to: "USDT"
    }

    Repo.insert! %Exchange{
      id: 2,
      name: "Poloniex",
      market_from: "BTC",
      market_to: "ETH"
    }

  end
end
