defmodule ElxGist.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ElxGistWeb.Telemetry,
      # Start the Ecto repository
      ElxGist.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElxGist.PubSub},
      # Start Finch
      {Finch, name: ElxGist.Finch},
      # Start the Endpoint (http/https)
      ElxGistWeb.Endpoint
      # Start a worker by calling: ElxGist.Worker.start_link(arg)
      # {ElxGist.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElxGist.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElxGistWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
