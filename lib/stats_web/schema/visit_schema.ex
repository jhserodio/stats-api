defmodule StatsWeb.Schema.Visit do
    use Absinthe.Schema.Notation

    alias StatsWeb.VisitsResolver

    object :visit_mutations do
        field :new_visit, :visit do
            arg :website, non_null(:id)
            arg :user, non_null(:id)
            arg :timestamp, :time

            resolve &VisitsResolver.new_visit/3
        end
    end
  end
  