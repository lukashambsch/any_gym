defmodule AnyGym.Member do
  use Ecto.Schema
  import Ecto.Changeset
  alias AnyGym.Member


  schema "members" do
    field :first_name, :string
    field :last_name, :string
    field :address_id, :id

    has_many :visits, AnyGym.Visit
    belongs_to :user, AnyGym.User

    timestamps()
  end

  @doc false
  def changeset(%Member{} = member, attrs) do
    member
    |> cast(attrs, [:first_name, :last_name])
    |> validate_required([:first_name])
    |> unique_constraint(:user_id)
  end
end
