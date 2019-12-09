defmodule Stats.Repo.Migrations.CreateVisits do
  use Ecto.Migration

  def change do
    create table(:visits) do
      add :timestamp, :utc_datetime, null: false
      add :website_id, references(:websites, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:visits, [:website_id])
    create index(:visits, [:user_id])
  end
end
