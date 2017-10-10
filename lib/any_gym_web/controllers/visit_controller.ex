defmodule AnyGymWeb.VisitController do
  use AnyGymWeb, :controller

  alias AnyGym.Repo

  def action(conn, _) do
    apply(__MODULE__, action_name(conn), [conn, conn.params, conn.assigns.current_user])
  end

  def index(conn, _params, current_user) do
    location = AnyGym.GymLocation
      |> Repo.get_by(user_id: current_user.id)
      |> Repo.preload(visits: [:member, :status])

    render conn, "index.html", visits: location.visits
  end

  def show(conn, %{"visit_id" => visit_id}, current_user) do
    visit = Ecto.assoc(current_user, :gym_location)
    |> Repo.all()
    |> Ecto.assoc(:visits)
    |> Repo.get(visit_id)
    |> Repo.preload([member: [:user], status: []])

    render conn, "show.html", visit: visit
  end
end
