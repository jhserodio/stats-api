defmodule StatsWeb.RecordsResolver do
    alias Stats.Records
    
    def user_list(_root, _args, _info) do
      users = Records.list_users()
      {:ok, users}
    end

    def user(_root, %{id: id}, _info) do
        case Records.get_user!(id) do
            nil ->
              {:error, "user with ID: #{id} not found"}
            user ->
              {:ok, user}
        end
    end

    def user_by_email(_root, %{email: email}, _info) do
        case Records.get_user_by_email!(email) do
            nil ->
              {:error, "user with e-mail: #{email} not found"}
            user ->
              {:ok, user}
        end
    end
end