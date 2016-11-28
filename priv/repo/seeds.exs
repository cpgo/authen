# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Authen.Repo.insert!(%Authen.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Authen.Repo.insert!(%Authen.Category{description: "Alimentação"})
Authen.Repo.insert!(%Authen.Category{description: "Trabalho"})
Authen.Repo.insert!(%Authen.Status{description: "Pago"})
Authen.Repo.insert!(%Authen.Status{description: "Não Pago"})
Authen.Repo.insert!(%Authen.Type{description: "Entrada"})
Authen.Repo.insert!(%Authen.Type{description: "Saída"})


# for _ <- 0..500 do
#   Authen.Repo.insert!( %Authen.Transaction{
#     type_id: 1, status_id: 1, category_id: 1,
#     date: Ecto.Date.utc, value: 1233,
#     account: "Não implementado", description: "Descrição"
#     })
#
#   Authen.Repo.insert!( %Authen.Transaction{
#     type_id: 2, status_id: 2, category_id: 2,
#     date: Ecto.Date.utc, value: 50,
#     account: "Não implementado", description: "Descrição 2"
#     })
#   end
