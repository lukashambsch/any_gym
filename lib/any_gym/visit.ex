defmodule AnyGym.Visit do
  use Ecto.Schema
  import Ecto.Changeset
  alias AnyGym.Visit


  schema "visits" do
    field :gym_location_id, :id
    field :status_id, :id

    belongs_to :member, AnyGym.Member

    timestamps()
  end

  @doc false
  def changeset(%Visit{} = visit, attrs) do
    visit
    |> cast(attrs, [])
    |> validate_required([])
  end
end
