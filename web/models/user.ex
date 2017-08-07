defmodule Cryptofolio.User do
  use Cryptofolio.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "users" do
    field :username, :string
    field :email, :string
    field :password, :string, virtual: true
    field :encrypted_password, :string
    has_many :assets, Cryptofolio.Asset

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def insert_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
    |> shared_changeset()
  end

  def update_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:username, :email, :password])
    |> validate_required([:username, :email])
    |> shared_changeset()
  end

  defp shared_changeset(changeset) do
    changeset
    |> validate_length(:password, min: 5)
    |> hash_password()
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> validate_format(:email, ~r/@/)
  end

  defp hash_password(changeset) do
    if password = get_change(changeset, :password) do
      changeset
      |> put_change(:encrypted_password, Comeonin.Bcrypt.hashpwsalt(password))
    else
      changeset
    end
  end
end
