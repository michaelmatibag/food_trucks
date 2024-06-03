defmodule FoodTrucksWeb.TruckController do
  use FoodTrucksWeb, :controller

  alias FoodTrucks.Food
  alias FoodTrucks.Food.Truck

  action_fallback FoodTrucksWeb.FallbackController

  def index(conn, _params) do
    trucks = Food.list_trucks()
    render(conn, "index.json", trucks: trucks)
  end

  def create(conn, %{"truck" => truck_params}) do
    with {:ok, %Truck{} = truck} <- Food.create_truck(truck_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.truck_path(conn, :show, truck))
      |> render("show.json", truck: truck)
    end
  end

  def show(conn, %{"id" => id}) do
    truck = Food.get_truck!(id)
    render(conn, "show.json", truck: truck)
  end

  def update(conn, %{"id" => id, "truck" => truck_params}) do
    truck = Food.get_truck!(id)

    with {:ok, %Truck{} = truck} <- Food.update_truck(truck, truck_params) do
      render(conn, "show.json", truck: truck)
    end
  end

  def delete(conn, %{"id" => id}) do
    truck = Food.get_truck!(id)

    with {:ok, %Truck{}} <- Food.delete_truck(truck) do
      send_resp(conn, :no_content, "")
    end
  end
end
