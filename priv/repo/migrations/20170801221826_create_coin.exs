defmodule Cryptofolio.Repo.Migrations.CreateCoin do
  use Ecto.Migration

  def change do
    create table(:coins) do
      add :name, :string
      add :symbol, :string

      timestamps()
    end

    create unique_index(:coins, [:name])
    create unique_index(:coins, [:symbol])

  end
end
