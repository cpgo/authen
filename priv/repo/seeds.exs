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

Authen.Repo.insert!(%Authen.Category{id: 1, description: "Alimentação"})
Authen.Repo.insert!(%Authen.Category{id: 2, description: "Trabalho"})

Authen.Repo.insert!(%Authen.Status{id: 1, description: "Pago"})
Authen.Repo.insert!(%Authen.Status{id: 2, description: "Não Pago"})

Authen.Repo.insert!(%Authen.Type{id: 1, description: "Entrada"})
Authen.Repo.insert!(%Authen.Type{id: 2, description: "Saída"})
