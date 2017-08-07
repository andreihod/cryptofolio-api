defmodule Cryptofolio.Asset do
  use Cryptofolio.Web, :model

  schema "assets" do
    field :mybalance, :decimal
    belongs_to :user, Cryptofolio.User, type: :binary_id
    belongs_to :exchange, Cryptofolio.Exchange
    belongs_to :coin, Cryptofolio.Coin

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:mybalance, :user_id, :exchange_id, :coin_id])
    |> assoc_constraint(:user)
    |> assoc_constraint(:exchange)
    |> assoc_constraint(:coin)
    |> validate_required([:mybalance])
  end
end
