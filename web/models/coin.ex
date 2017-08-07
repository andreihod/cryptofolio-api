defmodule Cryptofolio.Coin do
  use Cryptofolio.Web, :model

  schema "coins" do
    field :name, :string
    field :symbol, :string
    has_many :assets, Cryptofolio.Asset

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :symbol])
    |> unique_constraint(:name)
    |> unique_constraint(:symbol)
    |> validate_required([:name, :symbol])
  end
end
