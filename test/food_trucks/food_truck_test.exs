defmodule FoodTrucks.FoodTest do
  use FoodTrucks.DataCase, async: true

  alias FoodTrucks.Food
  alias FoodTrucks.Food.Truck

  describe "trucks" do
    @valid_attrs %{
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

    def truck_fixture(attrs \\ %{}) do
      {:ok, truck} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Food.create_truck()

      truck
    end

    test "list_trucks/0 returns all trucks" do
      truck = truck_fixture()
      assert Food.list_trucks() == [truck]
    end

    test "get_truck!/1 returns the truck with given id" do
      truck = truck_fixture()
      assert Food.get_truck!(truck.id) == truck
    end

    test "create_truck/1 with valid data creates a truck" do
      assert {:ok, %Truck{} = truck} = Food.create_truck(@valid_attrs)
      assert truck.applicant == "Some Applicant"
    end

    test "create_truck/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Food.create_truck(@invalid_attrs)
    end

    test "update_truck/2 with valid data updates the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{} = truck} = Food.update_truck(truck, @update_attrs)
      assert truck.applicant == "Updated Applicant"
    end

    test "update_truck/2 with invalid data returns error changeset" do
      truck = truck_fixture()
      assert {:error, %Ecto.Changeset{}} = Food.update_truck(truck, @invalid_attrs)
      assert truck == Food.get_truck!(truck.id)
    end

    test "delete_truck/1 deletes the truck" do
      truck = truck_fixture()
      assert {:ok, %Truck{}} = Food.delete_truck(truck)
      assert_raise Ecto.NoResultsError, fn -> Food.get_truck!(truck.id) end
    end

    test "change_truck/1 returns a truck changeset" do
      truck = truck_fixture()
      assert %Ecto.Changeset{} = Food.change_truck(truck)
    end
  end
end
