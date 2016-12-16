defmodule Authen.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :description, :string

      timestamps()
    end

  end
end
