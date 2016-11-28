defmodule Authen.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transaction) do
      add :type_id, references(:types)
      add :status_id, references(:status)
      add :category_id, references(:categories)
      add :date, :date
      add :value, :integer
      add :account, :string
      add :description, :text

      timestamps()
    end

  end
end
