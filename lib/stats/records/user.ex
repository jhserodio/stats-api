defmodule Stats.Records.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :date_of_birth, :date
    field :email, :string
    field :gender, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :gender, :date_of_birth])
    |> validate_required([:name, :email, :gender, :date_of_birth])
  end
end
