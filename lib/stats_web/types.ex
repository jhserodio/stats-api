defmodule StatsWeb.Schema.Types do
    use Absinthe.Schema.Notation
    import_types Absinthe.Type.Custom

    alias StatsWeb.Validators
    
    enum :gender do
        value :male  , as: "MALE"
        value :female, as: "FEMALE"
        value :unidentified, as: "UNIDENTIFIED"
    end

    enum :sort_field_user do
        value :id, as: :id
        value :name, as: :name
        value :email, as: :email
        value :date_of_birth, as: :date_of_birth
    end

    enum :sort_field_website do
        value :id, as: :id
        value :url, as: :url
        value :topic, as: :topic
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

    scalar :url do
        description "Url type"
        serialize fn(x) -> x end
        parse &Validators.is_url(&1.value)
    end

    scalar :topic do
        description "Topic type"
        serialize fn(x) -> x end
        parse &Validators.is_topic(&1.value)
    end

    object :user do
        field :id, non_null(:id)
        field :name, :string
        field :email, non_null(:email)
        field :gender, non_null(:gender)
        field :date_of_birth, :date
    end

    object :website do
        field :id, non_null(:id)
        field :url, non_null(:email)
        field :topic, :topic
    end

    object :visit do
        field :website, non_null(:website)
        field :user, non_null(:user)
        field :timestamp, :time
    end
end