defmodule Authen.TransactionsTest do
  use Authen.ModelCase

  alias Authen.Transactions

  @valid_attrs %{account: "some content", category: "some content", date: "some content", description: "some content", status: "some content", type: "some content", value: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Transactions.changeset(%Transactions{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Transactions.changeset(%Transactions{}, @invalid_attrs)
    refute changeset.valid?
  end
end
