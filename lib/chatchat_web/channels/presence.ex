defmodule ChatchatWeb.Presence do
  use Phoenix.Presence,
    otp_app: :my_app,
    pubsub_server: ChatchatWeb.PubSub
end
