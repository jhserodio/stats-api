defmodule StatsWeb.VisitsResolver do
    alias Stats.Records
    
    @doc """
    Create new Visit.

    ## Examples

        ### check with website and user exist
        iex> new_visit(_root, %{
              website: website,
              user: user,
              timestamp: timestamp
            , _info)
        {:ok, %Visit{}}
    """
    def new_visit(_root, %{
      website: website,
      user: user,
      timestamp: timestamp
    }, _info) do
      if Records.user_exist_id?(user) do
        if Records.website_exist_id?(website) do
          case Records.create_visit(%{
            website_id: String.to_integer(website),
            user_id: String.to_integer(user),
            timestamp: timestamp
          }) do
            {:ok, visit} ->
              {:ok, %{
                timestamp: visit.timestamp,
                user: Records.get_user!(user),
                website: Records.get_website!(website)
              }}
            _error ->
              {:error, "error for registry this visit"}
          end
        else
          {:error, "website with id: #{website} not exist"}
        end
      else
        {:error, "user with id: #{user} not exist"}
      end
    end
end