defmodule Cryptofolio.Repo.Migrations.CreateAsset do
  use Ecto.Migration

  def change do
    create table(:assets) do
      add :mybalance, :decimal
      add :user_id, references(:users, type: :binary_id), null: false
      add :exchange_id, references(:exchanges), null: false
      add :coin_id, references(:coins), null: false
      timestamps()
    end
  end


end
