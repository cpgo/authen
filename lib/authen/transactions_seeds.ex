defmodule Authen.TransactionSeeds do
  alias Authen.Transaction
  alias Authen.Repo

  def run(number) do
    for _ <- 0..number do
        Repo.insert!( %Transaction{
          type_id: :rand.uniform(2), status_id: :rand.uniform(2), category_id: :rand.uniform(2),
          date: Ecto.Date.utc, value: :rand.uniform(1000),
          account: "Não implementado", description: "Descrição"
          })
    end
  end
end
