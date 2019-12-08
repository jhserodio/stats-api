defmodule StatsWeb.Schema do
    
    use Absinthe.Schema
    import_types StatsWeb.Schema.User
    
    query do
        import_fields :user_query
    end

    mutation do
        import_fields :user_mutations
    end

end