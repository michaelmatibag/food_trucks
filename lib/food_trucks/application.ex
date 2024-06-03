defmodule FoodTrucks.Application do
  use Application

  def start(_type, _args) do
    children = [
      FoodTrucks.Repo,
      FoodTrucks.CSVFetcher,
      {Phoenix.PubSub, name: FoodTrucks.PubSub},
      FoodTrucksWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: FoodTrucks.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    FoodTrucksWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
