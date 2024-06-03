defmodule FoodTrucksWeb.TruckControllerTest do
  use FoodTrucksWeb.ConnCase, async: true

  alias FoodTrucks.Food
  alias FoodTrucks.Food.Truck

  @create_attrs %{
    applicant: "Some Applicant",
    facility_type: "Truck",
    location_description: "Some Location",
    address: "123 Some Street",
    permit: "12345",
    status: "REQUESTED",
    food_items: "Some food items",
    latitude: 37.7749,
    longitude: -122.4194,
    schedule: "Some schedule",
    noi_sent: "Some date",
    approved: "Some date",
    received: "Some date",
    prior_permit: "Some date",
    expiration_date: "Some date",
    location: "Some location",
    fire_prevention_districts: 1,
    police_districts: 1,
    supervisor_districts: 1,
    zip_codes: 94103,
    neighborhoods: 1
  }
  @update_attrs %{applicant: "Updated Applicant"}
  @invalid_attrs %{applicant: nil}

  def fixture(:truck) do
    {:ok, truck} = Food.create_truck(@create_attrs)
    truck
  end

  describe "index" do
    test "lists all trucks", %{conn: conn} do
      conn = get(conn, Routes.truck_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create truck" do
    test "renders truck when data is valid", %{conn: conn} do
      conn = post(conn, Routes.truck_path(conn, :create), truck: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.truck_path(conn, :show, id))
      assert %{
               "id" => id,
               "applicant" => "Some Applicant",
               "facility_type" => "Truck",
               "location_description" => "Some Location",
               "address" => "123 Some Street",
               "permit" => "12345",
               "status" => "REQUESTED",
               "food_items" => "Some food items",
               "latitude" => 37.7749,
               "longitude" => -122.4194,
               "schedule" => "Some schedule",
               "noi_sent" => "Some date",
               "approved" => "Some date",
               "received" => "Some date",
               "prior_permit" => "Some date",
               "expiration_date" => "Some date",
               "location" => "Some location",
               "fire_prevention_districts" => 1,
               "police_districts" => 1,
               "supervisor_districts" => 1,
               "zip_codes" => 94103,
               "neighborhoods" => 1
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.truck_path(conn, :create), truck: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update truck" do
    setup [:create_truck]

    test "renders truck when data is valid", %{conn: conn, truck: %Truck{id: id} = truck} do
      conn = put(conn, Routes.truck_path(conn, :update, truck), truck: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.truck_path(conn, :show, id))
      assert %{
               "id" => id,
               "applicant" => "Updated Applicant"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, truck: truck} do
      conn = put(conn, Routes.truck_path(conn, :update, truck), truck: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete truck" do
    setup [:create_truck]

    test "deletes chosen truck", %{conn: conn, truck: truck} do
      conn = delete(conn, Routes.truck_path(conn, :delete, truck))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.truck_path(conn, :show, truck))
      end
    end
  end

  defp create_truck(_) do
    truck = fixture(:truck)
    %{truck: truck}
  end
end
