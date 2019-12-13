defmodule StatsWeb.Router do
  use StatsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: StatsWeb.Schema,
      interface: :simple,
      context: %{pubsub: StatsWeb.Endpoint}

    
    forward "/", Absinthe.Plug,
      schema: StatsWeb.Schema

  end
end
