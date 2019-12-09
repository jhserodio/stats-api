defmodule StatsWeb.Schema.Stat do
    use Absinthe.Schema.Notation

    alias StatsWeb.StatsResolver

    object :stats_query do
        field :stats_total, list_of(:visit) do
            arg :initial_timestamp, :datetime, default_value: ~N[0001-01-01T01:01:01Z]
            arg :final_timestamp, :datetime, default_value: ~N[9999-01-01T01:01:01Z]
            resolve &StatsResolver.stats_total/3
        end
    end
  end
  