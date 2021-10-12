# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chatchat,
  ecto_repos: [Chatchat.Repo]

# Configures the endpoint
config :chatchat, ChatchatWeb.Endpoint,
  url: [scheme: "https", host: "chatchatphx.herokuapp.com/"],
  check_origin: [
    "https://chatchatphx.herokuapp.com/",
   "https://www.chatchatphx.herokuapp.com/"
  ],
  secret_key_base: "GH4a5ieuY6P47sC0qnnMILoZCvxKuJnzX8ZRnEm2Q/bPI/nQU3jtHY9gDAi4NIMN",
  render_errors: [view: ChatchatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Chatchat.PubSub,
  live_view: [signing_salt: "/iCEhCTz"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
