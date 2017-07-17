defmodule Cryptofolio.UserTest do
  use Cryptofolio.ModelCase

  alias Cryptofolio.User

  @valid_attrs %{email: "test@gmail.com", password: "teste123", username: "testuser"}
  @invalid_attrs %{email: "notemail", password: "tes", username: ""}

  test "changeset with valid attributes" do
    changeset = User.insert_changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.insert_changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  # TO-DO create update tests

end
