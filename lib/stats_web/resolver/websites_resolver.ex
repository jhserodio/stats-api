defmodule StatsWeb.WebsitesResolver do
    alias Stats.Records
    
    @doc """
    Gets website list.

    ## Examples

      query {
        websites(
            limit: 10
            skip: 2
            sort_field: URL
            sort_order: ASC
        ) [Website]
      }
    """
    def website_list(
        _root,
        %{
           limit: limit,
           skip: skip,
           sort_field: sort_field,
           sort_order: sort_order
        },
        _info
    ) do
      websites = Records.list_websites(limit, skip, sort_field, sort_order)
      {:ok, websites}
    end

    @doc """
    Gets website.

    ## Examples

      query {
        website(id: 1) Website
      }
    """
    def website(_root, %{id: id}, _info) do
        case Records.get_website!(id) do
            nil ->
              {:error, "website with ID: #{id} not found"}
            website ->
              {:ok, website}
        end
    end

    @doc """
    Gets website by url.

    ## Examples

      query {
        website(url: "www.mercafacil.com") Website
      }
    """
    def website_by_url(_root, %{url: url}, _info) do
        case Records.get_website_by_url!(url) do
            nil ->
              {:error, "website with e-mail: #{url} not found"}
            website ->
              {:ok, website}
        end
    end

    @doc """
    Upsert a website.

    ## Examples

        ### if has website with this url, update website
        iex> upsert_website(_root, args, _info)
        {:ok, %Website{}}

        ### else create website
        iex> upsert_website(_root, args, _info)
        {:error, %Ecto.Changeset{}}
    """
    def upsert_website(_root, args, _info) do
      if Records.website_exist?(args.url) do
        website = Records.get_website_by_url!(args.url)
        case Records.update_website(website, args) do
          {:ok, website} ->
            {:ok, website}
          _error ->
            {:error, "could not create website"}
        end
      else
        case Records.create_website(args) do
          {:ok, website} ->
            {:ok, website}
          _error ->
            {:error, "could not create website"}
        end
      end
    end
end