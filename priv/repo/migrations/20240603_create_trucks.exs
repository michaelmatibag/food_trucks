defmodule FoodTrucks.Repo.Migrations.CreateTrucks do
  use Ecto.Migration

  def change do
    create table(:trucks) do
      add :applicant, :string
      add :facility_type, :string
      add :location_description, :string
      add :address, :string
      add :permit, :string
      add :status, :string
      add :food_items, :string
      add :latitude, :float
      add :longitude, :float
      add :schedule, :string
      add :noi_sent, :string
      add :approved, :string
      add :received, :string
      add :prior_permit, :string
      add :expiration_date, :string
      add :location, :string
      add :fire_prevention_districts, :integer
      add :police_districts, :integer
      add :supervisor_districts, :integer
      add :zip_codes, :integer
      add :neighborhoods, :integer

      timestamps()
    end

    create unique_index(:trucks, [:applicant, :address])
  end
end
