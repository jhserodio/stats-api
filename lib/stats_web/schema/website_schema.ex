defmodule StatsWeb.Schema.Website do
    use Absinthe.Schema.Notation

    alias StatsWeb.WebsitesResolver

    object :website_query do
        field :websites, non_null(list_of(:website)) do
            arg :limit, :integer, default_value: 10
            arg :skip, :integer, default_value: 0
            arg :sort_field, :sort_field, default_value: :id
            arg :sort_order, :sort_order, default_value: :asc
            resolve &WebsitesResolver.website_list/3
        end

        field :website, non_null(:website) do
            arg :id, non_null(:id)
            resolve &WebsitesResolver.website/3
        end

        field :website_by_url, non_null(:website) do
            arg :url, non_null(:url)
            resolve &WebsitesResolver.website_by_url/3
        end
    end

    object :website_mutations do
        field :upsert_website, :website do
            arg :url, non_null(:url)
            arg :topic, :topic
            resolve &WebsitesResolver.upsert_website/3
        end
    end
  end
  