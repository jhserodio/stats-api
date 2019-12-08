defmodule StatsWeb.RecordsResolver do
    alias Stats.Records
    
    def user_list(
        _root,
        %{
           limit: limit,
           skip: skip,
           sort_field: sort_field,
           sort_order: sort_order
        },
        _info
    ) do
      users = Records.list_users(limit, skip, sort_field, sort_order)
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

    def upsert_user(_root, args, _info) do
      if Records.user_exist?(args.email) do
        user = Records.get_user_by_email!(args.email)
        case Records.update_user(user, args) do
          {:ok, user} ->
            {:ok, user}
          _error ->
            {:error, "could not create user"}
        end
      else
        case Records.create_user(args) do
          {:ok, user} ->
            {:ok, user}
          _error ->
            {:error, "could not create user"}
        end
      end
    end
end