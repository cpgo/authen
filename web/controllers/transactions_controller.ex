defmodule Authen.TransactionsController do
  use Authen.Web, :controller

  alias Authen.Transaction

  def index(conn, _params) do
    transaction =
      Repo.all(Transaction)
      |> Repo.preload([:type, :status, :category])
    render(conn, "index.html", transaction: transaction)
  end

  def new(conn, _params) do
    changeset = Transaction.changeset(%Transaction{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"transactions" => transactions_params}) do
    changeset = Transaction.changeset(%Transaction{}, transactions_params)

    case Repo.insert(changeset) do
      {:ok, _transactions} ->
        conn
        |> put_flash(:info, "Transaction created successfully.")
        |> redirect(to: transactions_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    transactions = Repo.get!(Transaction, id)
    render(conn, "show.html", transactions: transactions)
  end

  def edit(conn, %{"id" => id}) do
    transactions = Repo.get!(Transaction, id)
    changeset = Transaction.changeset(transactions)
    render(conn, "edit.html", transactions: transactions, changeset: changeset)
  end

  def update(conn, %{"id" => id, "transactions" => transactions_params}) do
    transactions = Repo.get!(Transaction, id)
    changeset = Transaction.changeset(transactions, transactions_params)

    case Repo.update(changeset) do
      {:ok, transactions} ->
        conn
        |> put_flash(:info, "Transaction updated successfully.")
        |> redirect(to: transactions_path(conn, :show, transactions))
      {:error, changeset} ->
        render(conn, "edit.html", transactions: transactions, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    transactions = Repo.get!(Transaction, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(transactions)

    conn
    |> put_flash(:info, "Transaction deleted successfully.")
    |> redirect(to: transactions_path(conn, :index))
  end
end
