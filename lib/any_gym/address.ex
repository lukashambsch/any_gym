defmodule AnyGym.Address do
  use Ecto.Schema
  import Ecto.Changeset
  alias AnyGym.Address


  schema "addresses" do
    field :city, :string
    field :country, :string
    field :latitude, :float
    field :longitude, :float
    field :postal_area, :string
    field :state_region, :string
    field :street_address, :string

    timestamps()
  end

  @doc false
  def changeset(%Address{} = address, attrs) do
    address
    |> cast(attrs, [:country, :state_region, :city, :postal_area, :street_address, :latitude, :longitude])
    |> validate_required([:country, :state_region, :city, :postal_area, :street_address, :latitude, :longitude])
  end
end
