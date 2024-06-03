defmodule FoodTrucks.Food.Truck do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trucks" do
    field :applicant, :string
    field :facility_type, :string
    field :location_description, :string
    field :address, :string
    field :permit, :string
    field :status, :string
    field :food_items, :string
    field :latitude, :float
    field :longitude, :float
    field :schedule, :string
    field :noi_sent, :string
    field :approved, :string
    field :received, :string
    field :prior_permit, :string
    field :expiration_date, :string
    field :location, :string
    field :fire_prevention_districts, :integer
    field :police_districts, :integer
    field :supervisor_districts, :integer
    field :zip_codes, :integer
    field :neighborhoods, :integer

    timestamps()
  end

  @doc false
  def changeset(truck, attrs) do
    truck
    |> cast(attrs, [:applicant, :facility_type, :location_description, :address, :permit, :status, :food_items, :latitude, :longitude, :schedule, :noi_sent, :approved, :received, :prior_permit, :expiration_date, :location, :fire_prevention_districts, :police_districts, :supervisor_districts, :zip_codes, :neighborhoods])
    |> validate_required([:applicant, :facility_type, :address, :permit, :status, :food_items, :latitude, :longitude, :schedule, :expiration_date])
  end
end
