defmodule FoodTrucksWeb.Router do
  use FoodTrucksWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FoodTrucksWeb do
    pipe_through :api

    resources "/trucks", TruckController, except: [:new, :edit]
  end
end
