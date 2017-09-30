defmodule AnyGymWeb.VisitController do
  use AnyGymWeb, :controller

  import Ecto.Query

  def action(conn, _) do
    apply(__MODULE__, action_name(conn), [conn, conn.params, conn.assigns.current_user])
  end

  def index(conn, _params, current_user) do
    location = AnyGym.GymLocation
      |> AnyGym.Repo.get_by(user_id: current_user.id)
      |> AnyGym.Repo.preload(visits: [:member, :status])

    render conn, "index.html", visits: location.visits
  end

  def show(conn, %{"visit_id" => visit_id}, current_user) do
    visit = Ecto.assoc(current_user, :gym_location)
      |> AnyGym.Repo.all()
      |> Ecto.assoc(:visits)
      |> AnyGym.Repo.get(visit_id)
      |> AnyGym.Repo.preload([member: [:user], status: []])

    render conn, "show.html", visit: visit
  end
end
