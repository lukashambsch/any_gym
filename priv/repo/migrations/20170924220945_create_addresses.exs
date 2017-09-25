defmodule AnyGym.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :country, :string
      add :state_region, :string
      add :city, :string
      add :postal_area, :string
      add :street_address, :string
      add :latitude, :float
      add :longitude, :float

      timestamps()
    end

    create unique_index(:addresses, [:country, :state_region, :city, :postal_area, :street_address])
  end
end
