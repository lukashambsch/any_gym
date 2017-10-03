# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :any_gym,
  ecto_repos: [AnyGym.Repo]

# Configures the endpoint
config :any_gym, AnyGymWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ewRyOooNH4xQt35aguhaWH20zCUElYFOm6xMGDQ2Lx1HZB4Y3W0Ro57nf5WTuA6D",
  render_errors: [view: AnyGymWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AnyGym.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure Guardian for authentication
config :any_gym, AnyGymWeb.Guardian,
  issuer: "AnyGymWeb.#{Mix.env}",
  ttl: {30, :days},
  verify_issuer: true,
  secret_key: to_string(Mix.env) <> "SuPerseCret_aBraCadabrA"
