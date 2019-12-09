defmodule StatsWeb.Schema.Stat do
    use Absinthe.Schema.Notation

    alias StatsWeb.StatsResolver

    object :stats_query do
        field :stats_total, :stats do
            arg :initial_timestamp, :datetime
            arg :final_timestamp, :datetime
            resolve &StatsResolver.stats_total/3
        end

        field :stats_by_website, :stats do
            arg :initial_timestamp, :datetime
            arg :final_timestamp, :datetime
            arg :min_age, :date
            arg :max_age, :date
            arg :gender, :gender
            arg :users, list_of(:email)
            arg :websites, list_of(:url)
            resolve &StatsResolver.stats_by/3
        end

        field :stats_by_user, :stats do
            arg :initial_timestamp, :datetime
            arg :final_timestamp, :datetime
            arg :min_age, :date
            arg :max_age, :date
            arg :gender, :gender
            arg :users, list_of(:email), default_value: []
            arg :websites, list_of(:url), default_value: []
            resolve &StatsResolver.stats_by/3
        end
    end
  end
  