use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :any_gym, AnyGymWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :any_gym, AnyGym.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "lukashambsch",
  password: "",
  database: "any_gym_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Reduce number of rounds during testing
config :argon2_elixir,
  t_cost: 2,
  m_cost: 12
