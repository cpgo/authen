defmodule Authen.Type do
  use Authen.Web, :model

  schema "types" do
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
