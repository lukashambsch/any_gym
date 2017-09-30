defmodule AnyGym.Repo.Migrations.CreateMembers do
  use Ecto.Migration

  def change do
    create table(:members) do
      add :first_name, :string
      add :last_name, :string
      add :user_id, references(:users, on_delete: :nothing), null: false
      add :address_id, references(:addresses, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:members, [:user_id])
    create index(:members, [:address_id])
  end
end
