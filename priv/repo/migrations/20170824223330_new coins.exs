defmodule :"Elixir.Cryptofolio.Repo.Migrations.New coins" do
  use Ecto.Migration
  use Cryptofolio.Web, :new_markets

  def change do

    Repo.insert! %Coin{
      name: "Bitcoin",
      symbol: "BTC"
    }

    Repo.insert! %Coin{
      name: "Ethereum",
      symbol: "ETH"
    }

    Repo.insert! %Coin{
      name: "Bitcoin Cash",
      symbol: "BCH"
    }

    Repo.insert! %Coin{
      name: "Ripple",
      symbol: "XRP"
    }

    Repo.insert! %Coin{
      name: "Litecoin",
      symbol: "LTC"
    }

    Repo.insert! %Coin{
      name: "ZCash",
      symbol: "ZEC"
    }

    Repo.insert! %Coin{
      name: "Monero",
      symbol: "XMR"
    }

    Repo.insert! %Coin{
      name: "Dash",
      symbol: "DASH"
    }

    Repo.insert! %Exchange{
      name: "Poloniex",
      market_from: "BTC",
      market_to: "USDT"
    }

    Repo.insert! %Exchange{
      name: "Poloniex",
      market_from: "BTC",
      market_to: "ETH"
    }

    Repo.insert! %Exchange{
      name: "Poloniex",
      market_from: "BTC",
      market_to: "BCH"
    }

    Repo.insert! %Exchange{
      name: "Poloniex",
      market_from: "BTC",
      market_to: "XRP"
    }

    Repo.insert! %Exchange{
      name: "Poloniex",
      market_from: "BTC",
      market_to: "LTC"
    }

    Repo.insert! %Exchange{
      name: "Poloniex",
      market_from: "BTC",
      market_to: "BCH"
    }

    Repo.insert! %Exchange{
      name: "Poloniex",
      market_from: "BTC",
      market_to: "ZEC"
    }

    Repo.insert! %Exchange{
      name: "Poloniex",
      market_from: "BTC",
      market_to: "XMR"
    }

    Repo.insert! %Exchange{
      name: "Poloniex",
      market_from: "BTC",
      market_to: "DASH"
    }

  end
end
