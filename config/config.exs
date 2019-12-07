# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :stats,
  ecto_repos: [Stats.Repo]

# Configures the endpoint
config :stats, StatsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Har/wh2OOvoO5rg+7DP1DuXAkmEYK9FEluCQYy41U2de2+9y8hS3U1xmPX7BV7y/",
  render_errors: [view: StatsWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Stats.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
