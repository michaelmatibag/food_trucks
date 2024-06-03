defmodule FoodTrucks do
  @moduledoc """
  FoodTrucks keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias FoodTrucks.Food

  defdelegate list_trucks, to: Food

  defdelegate get_truck!(id), to: Food

  defdelegate create_truck(attrs \\ %{}), to: Food

  defdelegate update_truck(truck, attrs), to: Food

  defdelegate delete_truck(truck), to: Food

  defdelegate change_truck(truck, attrs \\ %{}), to: Food
end
