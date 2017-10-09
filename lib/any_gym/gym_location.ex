defmodule AnyGym.GymLocation do
  use Ecto.Schema
  import Ecto.Changeset
  alias AnyGym.GymLocation


  schema "gym_locations" do
    field :in_network, :boolean, default: false
    field :location_name, :string
    field :monthly_membership_fee, :float
    field :phone_number, :string
    field :website_url, :string
    field :address_id, :id

    has_many :visits, AnyGym.Visit
    belongs_to :user, AnyGym.User

    timestamps()
  end

  @doc false
  def changeset(%GymLocation{} = gym_location, attrs) do
    gym_location
    |> cast(attrs, [:location_name, :phone_number, :website_url, :in_network, :monthly_membership_fee])
    |> validate_required([:location_name, :phone_number, :website_url, :in_network, :monthly_membership_fee])
    |> validate_length(:phone_number, min: 10, max: 10)
    |> assoc_constraint(:user)
  end
end
