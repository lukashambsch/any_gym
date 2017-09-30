defmodule AnyGymWeb.LayoutView do
  use AnyGymWeb, :view

  def is_gym(user) do
    Ecto.assoc(user, :gym_location) |> AnyGym.Repo.one()
  end

  def is_member(user) do
    Ecto.assoc(user, :member) |> AnyGym.Repo.one()
  end
end
