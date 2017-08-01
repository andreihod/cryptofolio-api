use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :cryptofolio, Cryptofolio.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :cryptofolio, Cryptofolio.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "ubuntu",
  password: "",
  database: "cryptofolio_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# Reduce the rounds so it does not slow down the tests
config :comeonin, :bcrypt_log_rounds, 4

# import the local test config if exists
import_config "test.local.exs"
