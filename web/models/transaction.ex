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

  def inflow(query) do
    from t in query, where: t.type_id == 1
  end


  def outflow(query) do
    from t in query, where: t.type_id == 2
  end

  def by_day(query, date \\ Ecto.Date.utc) do
    from t in query, where: t.date == ^date
  end

  def select_sum_of_inflow_and_outflow(query) do
    from t in query, select: %{
      inflow_total: sum(fragment("CASE WHEN ? = 1 THEN ? END", t.type_id, t.value)),
      outflow_total: sum(fragment("CASE WHEN ? = 2 THEN ? END", t.type_id, t.value))
    }
  end

end
