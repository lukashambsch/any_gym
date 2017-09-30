defmodule AnyGym.Repo.Migrations.CreateStatuses do
  use Ecto.Migration

  def change do
    create table(:statuses) do
      add :status_name, :string, null: false

      timestamps()
    end

    create unique_index(:statuses, [:status_name])
  end
end
