defmodule FoodTrucksWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :food_trucks

  socket "/socket", FoodTrucksWeb.UserSocket,
    websocket: true,
    longpoll: false

  plug Plug.Static,
    at: "/",
    from: :food_trucks,
    gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, store: :cookie, key: "_food_trucks_key",
    signing_salt: "SIGNING_SALT"

  plug FoodTrucksWeb.Router
end
