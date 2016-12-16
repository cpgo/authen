defmodule Authen.TransactionInfo do
  import Plug.Conn
  alias Authen.Transaction
  alias Authen.Repo

  def init(opts) do
    opts
  end


  def call(conn, _) do
    values = %{
        today: Transaction |> Transaction.by_day |> Transaction.select_sum_of_inflow_and_outflow |> Repo.one,
        total: Transaction |> Transaction.select_sum_of_inflow_and_outflow |> Repo.one
      }
    assign(conn, :transaction_values, values)
  end


end
