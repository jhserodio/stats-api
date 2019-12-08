defmodule StatsWeb.Schema.User do
    use Absinthe.Schema.Notation

    alias StatsWeb.UsersResolver

    object :user_query do
        field :users, non_null(list_of(:user)) do
            arg :limit, :integer, default_value: 10
            arg :skip, :integer, default_value: 0
            arg :sort_field, :sort_field, default_value: :id
            arg :sort_order, :sort_order, default_value: :asc
            resolve &UsersResolver.user_list/3
        end

        field :user, non_null(:user) do
            arg :id, non_null(:id)
            resolve &UsersResolver.user/3
        end

        field :user_by_email, non_null(:user) do
            arg :email, non_null(:email)
            resolve &UsersResolver.user_by_email/3
        end
    end

    object :user_mutations do
        field :upsert_user, :user do
            arg :email, non_null(:email)
            arg :name, :string
            arg :gender, :gender
            arg :date_of_birth, :date

            resolve &UsersResolver.upsert_user/3
        end
    end
  end
  