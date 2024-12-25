defmodule PhoenixMishkaChelekomSample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixMishkaChelekomSampleWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:phoenix_mishka_chelekom_sample, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixMishkaChelekomSample.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixMishkaChelekomSample.Finch},
      # Start a worker by calling: PhoenixMishkaChelekomSample.Worker.start_link(arg)
      # {PhoenixMishkaChelekomSample.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixMishkaChelekomSampleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixMishkaChelekomSample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixMishkaChelekomSampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
