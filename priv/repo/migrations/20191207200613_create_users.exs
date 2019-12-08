defmodule Stats.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :gender, :string
      add :date_of_birth, :date

      timestamps()
    end

  end
end
