defmodule AnyGym.Status do
  use Ecto.Schema
  import Ecto.Changeset
  alias AnyGym.Status


  schema "statuses" do
    field :status_name, :string

    timestamps()
  end

  @doc false
  def changeset(%Status{} = status, attrs) do
    status
    |> cast(attrs, [:status_name])
    |> validate_required([:status_name])
    |> unique_constraint(:status_name)
  end
end
