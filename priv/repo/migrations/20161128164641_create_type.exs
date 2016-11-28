defmodule Authen.Repo.Migrations.CreateType do
  use Ecto.Migration

  def change do
    create table(:types) do
      add :description, :string

      timestamps()
    end
    create unique_index(:types, :description)
  end
end
