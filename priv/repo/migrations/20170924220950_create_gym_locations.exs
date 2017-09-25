defmodule AnyGym.Repo.Migrations.CreateGymLocations do
  use Ecto.Migration

  def change do
    create table(:gym_locations) do
      add :location_name, :string, null: false
      add :phone_number, :string
      add :website_url, :string
      add :in_network, :boolean, default: false, null: false
      add :monthly_membership_fee, :float
      add :address_id, references(:addresses, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:gym_locations, [:address_id])
    create index(:gym_locations, [:user_id])
  end
end
