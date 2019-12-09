defmodule StatsWeb.Schema.Stat do
    use Absinthe.Schema.Notation

    alias StatsWeb.StatsResolver

    object :stats_query do
        field :stats_total, non_null(:stats) do
            arg :initial_timestamp, :datetime
            arg :final_timestamp, :datetime
            resolve &UsersResolver.user_list/3
        end
    end
  end
  