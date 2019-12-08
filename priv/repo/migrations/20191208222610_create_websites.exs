defmodule Stats.Repo.Migrations.CreateWebsites do
  use Ecto.Migration

  def change do
    create table(:websites) do
      add :url, :string, null: false
      add :topic, :string

      timestamps()
    end

    create unique_index(:websites, [:url])
  end
end
