use Mix.Config

# Do not print debug messages in production
config :logger, level: :info


# Configure your database
config :chatchat, ChatchatWeb.Endpoint,
http: [port: {:system, "PORT"}],
url: [scheme: "https", host: "chatchatphx.herokuapp.com/", port: 443],
force_ssl: [rewrite_on: [:x_forwarded_proto]]

# Finally import the config/prod.secret.exs which loads secrets
# and configuration from environment variables.
import_config "prod.secret.exs"
