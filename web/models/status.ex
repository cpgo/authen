defmodule Authen.Status do
  use Authen.Web, :model

  schema "status" do
    field :description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description])
    |> validate_required([:description])
    |> unique_constraint(:description)
  end
end
