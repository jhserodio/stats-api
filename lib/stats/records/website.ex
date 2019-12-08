defmodule Stats.Records.Website do
  use Ecto.Schema
  import Ecto.Changeset

  schema "websites" do
    field :topic, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(website, attrs) do
    website
    |> cast(attrs, [:url, :topic])
    |> validate_required([:url, :topic])
  end
end
