defmodule Authen.TransactionsControllerTest do
  use Authen.ConnCase

  alias Authen.Transactions
  @valid_attrs %{account: "some content", category: "some content", date: "some content", description: "some content", status: "some content", type: "some content", value: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, transactions_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing transaction"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, transactions_path(conn, :new)
    assert html_response(conn, 200) =~ "New transactions"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, transactions_path(conn, :create), transactions: @valid_attrs
    assert redirected_to(conn) == transactions_path(conn, :index)
    assert Repo.get_by(Transactions, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, transactions_path(conn, :create), transactions: @invalid_attrs
    assert html_response(conn, 200) =~ "New transactions"
  end

  test "shows chosen resource", %{conn: conn} do
    transactions = Repo.insert! %Transactions{}
    conn = get conn, transactions_path(conn, :show, transactions)
    assert html_response(conn, 200) =~ "Show transactions"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, transactions_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    transactions = Repo.insert! %Transactions{}
    conn = get conn, transactions_path(conn, :edit, transactions)
    assert html_response(conn, 200) =~ "Edit transactions"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    transactions = Repo.insert! %Transactions{}
    conn = put conn, transactions_path(conn, :update, transactions), transactions: @valid_attrs
    assert redirected_to(conn) == transactions_path(conn, :show, transactions)
    assert Repo.get_by(Transactions, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    transactions = Repo.insert! %Transactions{}
    conn = put conn, transactions_path(conn, :update, transactions), transactions: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit transactions"
  end

  test "deletes chosen resource", %{conn: conn} do
    transactions = Repo.insert! %Transactions{}
    conn = delete conn, transactions_path(conn, :delete, transactions)
    assert redirected_to(conn) == transactions_path(conn, :index)
    refute Repo.get(Transactions, transactions.id)
  end
end
