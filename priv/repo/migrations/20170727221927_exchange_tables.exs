defmodule Cryptofolio.Repo.Migrations.ExchangeTables do
  use Ecto.Migration

  def change do
    create table(:exchanges) do
      add :name, :string
      add :market_from, :string
      add :market_to, :string
      add :price, :decimal

      timestamps()
    end

  end
end
