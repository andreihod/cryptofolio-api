# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cryptofolio,
  ecto_repos: [Cryptofolio.Repo]

# Configures the endpoint
config :cryptofolio, Cryptofolio.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nEGHH72peYp1MpjjvUsexWp4svsu4dqOg/N4D5L9cfnedIbTWYuhn77WtNIGzMg/",
  render_errors: [view: Cryptofolio.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cryptofolio.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
