defmodule Cryptofolio.Exchange do
  use Cryptofolio.Web, :model

  schema "exchanges" do
    field :name, :string
    field :market_from, :string
    field :market_to, :string
    field :price, :decimal
    has_many :assets, Cryptofolio.Asset

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :market_from, :market_to, :price])
    |> validate_required([:name, :market_from, :market_to])
  end
end
