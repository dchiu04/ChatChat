defmodule Chatchat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Chatchat.Repo,
      # Start the Telemetry supervisor
      ChatchatWeb.Telemetry,
      ChatchatWeb.Presence,
      # Start the PubSub system
      {Phoenix.PubSub, name: Chatchat.PubSub},
      # Start the Endpoint (http/https)
      ChatchatWeb.Endpoint
      # Start a worker by calling: Chatchat.Worker.start_link(arg)
      # {Chatchat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Chatchat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ChatchatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
