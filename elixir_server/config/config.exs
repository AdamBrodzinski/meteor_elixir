# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :chatty, Chatty.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "Yh73FWyxZvqxk4mXDGmzQXshfYaT/xPPBjuNv3jd3dxmbGPlFZuxs2C5iLegKyQS",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Chatty.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

config :my_app, Repo,
  database: "ecto_simple",
  username: "mongodb",
  password: "mongosb",
  hostname: "localhost"

