defmodule AnyGym.Repo.Migrations.AddImageUrlField do
  use Ecto.Migration

  def change do
    alter table(:members) do
      add :image_url, :string
    end
  end
end
