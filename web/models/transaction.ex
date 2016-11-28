defmodule Authen.Transaction do
  use Authen.Web, :model

  schema "transaction" do
    belongs_to :type, Authen.Type
    belongs_to :status, Authen.Status
    belongs_to :category, Authen.Category
    field :date, Ecto.Date
    field :value, :integer
    field :account, :string
    field :description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:type, :date, :value, :status, :account, :category, :description])
    |> validate_required([:type, :date, :value, :status, :account, :category, :description])
  end
end
