defmodule StatsWeb.Schema.Stat do
    use Absinthe.Schema.Notation

    alias StatsWeb.StatsResolver

    object :stats_query do
        field :stats_total, :stats do
            arg :initial_timestamp, :datetime, default_value: DateTime.from_naive!(~N[0001-01-01T01:01:01Z], "Etc/UTC")
            arg :final_timestamp, :datetime, default_value: DateTime.from_naive!(~N[9999-01-01T01:01:01Z], "Etc/UTC")
            resolve &StatsResolver.stats_total/3
        end

        field :stats_by_website, :stats do
            arg :initial_timestamp, :datetime, default_value: DateTime.from_naive!(~N[0001-01-01T01:01:01Z], "Etc/UTC")
            arg :final_timestamp, :datetime, default_value: DateTime.from_naive!(~N[9999-01-01T01:01:01Z], "Etc/UTC")
            arg :min_age, :integer
            arg :max_age, :integer
            arg :gender, :gender
            arg :users, list_of(:email)
            arg :websites, list_of(:url)
            resolve &StatsResolver.stats_by/3
        end

        field :stats_by_user, :stats do
            arg :initial_timestamp, :datetime, default_value: DateTime.from_naive!(~N[0001-01-01T01:01:01Z], "Etc/UTC")
            arg :final_timestamp, :datetime, default_value: DateTime.from_naive!(~N[9999-01-01T01:01:01Z], "Etc/UTC")
            arg :min_age, :integer, default_value: nil
            arg :max_age, :integer, default_value: nil
            arg :gender, :gender, default_value: nil
            arg :users, list_of(:email), default_value: []
            arg :websites, list_of(:url), default_value: []
            resolve &StatsResolver.stats_by/3
        end
    end
  end
  