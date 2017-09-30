defmodule AnyGym.Repo.Migrations.CreateVisits do
  use Ecto.Migration

  def change do
    create table(:visits) do
      add :member_id, references(:members, on_delete: :nothing), null: false
      add :gym_location_id, references(:gym_locations, on_delete: :nothing), null: false
      add :status_id, references(:statuses, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:visits, [:member_id])
    create index(:visits, [:gym_location_id])
    create index(:visits, [:status_id])
  end
end
