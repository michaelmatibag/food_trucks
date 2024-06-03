defmodule FoodTrucks.Food do
  @moduledoc """
  The Food context.
  """

  import Ecto.Query, warn: false
  alias FoodTrucks.Repo
  alias FoodTrucks.Food.Truck

  @doc """
  Returns the list of trucks.
  """
  def list_trucks do
    Repo.all(Truck)
  end

  @doc """
  Gets a single truck.

  Raises `Ecto.NoResultsError` if the Truck does not exist.
  """
  def get_truck!(id), do: Repo.get!(Truck, id)

  @doc """
  Creates a truck.
  """
  def create_truck(attrs \\ %{}) do
    %Truck{}
    |> Truck.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a truck.
  """
  def update_truck(%Truck{} = truck, attrs) do
    truck
    |> Truck.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a truck.
  """
  def delete_truck(%Truck{} = truck) do
    Repo.delete(truck)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking truck changes.

  ## Examples

      iex> change_truck(truck)
      %Ecto.Changeset{data: %Truck{}}

  """
  def change_truck(%Truck{} = truck, attrs \\ %{}) do
    Truck.changeset(truck, attrs)
  end
end
