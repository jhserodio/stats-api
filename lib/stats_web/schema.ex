defmodule StatsWeb.Schema do
    
    use Absinthe.Schema
    import_types StatsWeb.Schema.Types
    import_types StatsWeb.Schema.User
    import_types StatsWeb.Schema.Website
    import_types StatsWeb.Schema.Visit
    import_types StatsWeb.Schema.Stat
    
    query do
        import_fields :user_query
        import_fields :website_query
        import_fields :stats_query
    end

    mutation do
        import_fields :user_mutations
        import_fields :website_mutations
        import_fields :visit_mutations
    end

end