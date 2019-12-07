defmodule StatsWeb.RecordsResolver do
    alias Stats.Records
    
    def user_list(_root, _args, _info) do
      users = Records.list_users()
      {:ok, users}
    end
end