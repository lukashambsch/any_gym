defmodule AnyGym.Visit do
  use Ecto.Schema
  import Ecto.Changeset
  alias AnyGym.Visit


  schema "visits" do
    belongs_to :member, AnyGym.Member
    belongs_to :status, AnyGym.Status
    belongs_to :gym_location, AnyGym.GymLocation

    timestamps()
  end

  @doc false
  def changeset(%Visit{} = visit, attrs) do
    visit
    |> cast(attrs, [])
    |> validate_required([])
  end
end
