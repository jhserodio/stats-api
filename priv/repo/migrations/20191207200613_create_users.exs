defmodule Stats.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string, null: false
      add :gender, :string, null: false
      add :date_of_birth, :date

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
