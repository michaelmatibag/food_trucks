defmodule FoodTrucksWeb.TruckView do
  use FoodTrucksWeb, :view

  def render("index.json", %{trucks: trucks}) do
    %{data: render_many(trucks, FoodTrucksWeb.TruckView, "truck.json")}
  end

  def render("show.json", %{truck: truck}) do
    %{data: render_one(truck, FoodTrucksWeb.TruckView, "truck.json")}
  end

  def render("truck.json", %{truck: truck}) do
    %{
      id: truck.id,
      applicant: truck.applicant,
      facility_type: truck.facility_type,
      location_description: truck.location_description,
      address: truck.address,
      permit: truck.permit,
      status: truck.status,
      food_items: truck.food_items,
      latitude: truck.latitude,
      longitude: truck.longitude,
      schedule: truck.schedule,
      noi_sent: truck.noi_sent,
      approved: truck.approved,
      received: truck.received,
      prior_permit: truck.prior_permit,
      expiration_date: truck.expiration_date,
      location: truck.location,
      fire_prevention_districts: truck.fire_prevention_districts,
      police_districts: truck.police_districts,
      supervisor_districts: truck.supervisor_districts,
      zip_codes: truck.zip_codes,
      neighborhoods: truck.neighborhoods
    }
  end
end
