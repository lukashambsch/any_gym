defmodule AnyGymWeb.VisitController do
  use AnyGymWeb, :controller

  import Ecto.Query

  def list(conn, _params) do
    location = AnyGym.GymLocation
      |> AnyGym.Repo.get_by(user_id: 1)
      |> AnyGym.Repo.preload(visits: [:member])
    render conn, "list.html", visits: location.visits
  end

  def detail(conn, %{"visit_id" => visit_id}) do
    render conn, "detail.html", visit: visit_id
  end
end
