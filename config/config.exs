import Config

config :food_trucks,
  ecto_repos: [FoodTrucks.Repo]

config :food_trucks, FoodTrucks.Repo,
  database: "food_trucks_dev",
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  pool_size: 10

config :food_trucks, FoodTrucksWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "SECRET_KEY_BASE",
  render_errors: [view: FoodTrucksWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: FoodTrucks.PubSub,
  live_view: [signing_salt: "SIGNING_SALT"]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{Mix.env()}.exs"
