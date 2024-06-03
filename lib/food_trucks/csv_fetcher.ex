defmodule FoodTrucks.CSVFetcher do
  use GenServer
  alias FoodTrucks.Repo
  alias FoodTrucks.Food.Truck

  @csv_url "https://data.sfgov.org/api/views/rqzj-sfat/rows.csv"

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(state) do
    schedule_fetch()
    {:ok, state}
  end

  def handle_info(:fetch_csv, state) do
    fetch_and_import_csv()
    schedule_fetch()
    {:noreply, state}
  end

  defp schedule_fetch do
    Process.send_after(self(), :fetch_csv, 3600 * 1000) # 1 hour
  end

  defp fetch_and_import_csv do
    @csv_url
    |> HTTPoison.get()
    |> handle_response()
  end

  defp handle_response({:ok, %HTTPoison.Response{body: body}}) do
    body
    |> parse_csv()
    |> Enum.each(&import_truck/1)
  end

  defp handle_response(_response), do: :error

  defp parse_csv(body) do
    body
    |> NimbleCSV.RFC4180.parse_string()
    |> Enum.map(fn [
      locationid, applicant, facility_type, cnn, location_description, address,
      blocklot, block, lot, permit, status, food_items, x, y, latitude, longitude,
      schedule, dayshours, noi_sent, approved, received, prior_permit, expiration_date,
      location, fire_prevention_districts, police_districts, supervisor_districts,
      zip_codes, neighborhoods] ->
      %{
        applicant: applicant,
        facility_type: facility_type,
        location_description: location_description,
        address: address,
        permit: permit,
        status: status,
        food_items: food_items,
        latitude: String.to_float(latitude),
        longitude: String.to_float(longitude),
        schedule: schedule,
        noi_sent: noi_sent,
        approved: approved,
        received: received,
        prior_permit: prior_permit,
        expiration_date: expiration_date,
        location: location,
        fire_prevention_districts: String.to_integer(fire_prevention_districts),
        police_districts: String.to_integer(police_districts),
        supervisor_districts: String.to_integer(supervisor_districts),
        zip_codes: String.to_integer(zip_codes),
        neighborhoods: String.to_integer(neighborhoods)
      }
    end)
  end

  defp import_truck(attrs) do
    %Truck{}
    |> Truck.changeset(attrs)
    |> Repo.insert(on_conflict: :replace_all, conflict_target: [:applicant, :address])
  end
end
