defmodule StatsWeb.Schema do
    use Absinthe.Schema
    
    import_types(Absinthe.Type.Custom)

    alias StatsWeb.RecordsResolver
    alias StatsWeb.Validators

    enum :gender do
        value :male  , as: "MALE"
        value :female, as: "FEMALE"
        value :unidentified, as: "UNIDENTIFIED"
    end

    enum :sort_field do
        value :name, as: :name
        value :email, as: :email
        value :gender, as: :gender
        value :date_of_birth, as: :date_of_birth
    end

    enum :sort_order do
        value :asc
        value :desc
    end

    scalar :email do
        description "Email type"
        serialize fn(x) -> x end
        parse &Validators.is_email(&1.value)
    end

    object :user do
        field :id, non_null(:id)
        field :name, non_null(:string)
        field :email, non_null(:email)
        field :gender, non_null(:gender)
        field :date_of_birth, non_null(:date)
    end

    query do
        field :users, non_null(list_of(:user)) do
            arg :limit, :integer, default_value: 10
            arg :skip, :integer, default_value: 0
            arg :sort_field, :sort_field, default_value: :name
            arg :sort_order, :sort_order, default_value: :asc
            resolve &RecordsResolver.user_list/3
        end

        field :user, non_null(:user) do
            arg :id, non_null(:id)
            resolve &RecordsResolver.user/3
        end

        field :user_by_email, non_null(:user) do
            arg :email, non_null(:email)
            resolve &RecordsResolver.user_by_email/3
        end
    end

end