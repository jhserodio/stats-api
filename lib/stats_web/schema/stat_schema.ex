defmodule StatsWeb.Schema.Stat do
    use Absinthe.Schema.Notation

    alias StatsWeb.StatsResolver

    object :stats_query do
        field :stats_total, :stats do
            arg :initial_timestamp, :datetime, default_value: DateTime.from_naive!(~N[0001-01-01T01:01:01Z], "Etc/UTC")
            arg :final_timestamp, :datetime, default_value: DateTime.from_naive!(~N[9999-01-01T01:01:01Z], "Etc/UTC")
            resolve &StatsResolver.stats_total/3
        end
    end
  end
  