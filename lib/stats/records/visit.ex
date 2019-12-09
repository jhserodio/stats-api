defmodule Stats.Records.Visit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "visits" do
    field :timestamp, :utc_datetime
    field :website_id, :id
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(visit, attrs) do
    visit
    |> cast(attrs, [:timestamp, :website_id, :user_id])
    |> validate_required([:timestamp])
  end
end
