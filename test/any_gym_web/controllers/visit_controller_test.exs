defmodule AnyGymWeb.VisitControllerTest do
  use AnyGymWeb.ConnCase, async: true

  setup do
    visit = insert(:visit)
    conn = build_conn()
    |> AnyGymWeb.Auth.login(visit.gym_location.user)

    {:ok, conn: conn, visit: visit}
  end

  test "index/3 responds with visit index page", state do
    conn = state[:conn]
    visit = state[:visit]

    response = conn
    |> get(visit_path(conn, :index))
    |> response(200)

    assert response =~ Phoenix.View.render_to_string(AnyGymWeb.VisitView, "index.html", visits: [visit])
  end

  test "show/3 responds with visit show page", state do
    conn = state[:conn]
    visit = state[:visit]

    response = conn
    |> get(visit_path(conn, :show, visit.id))
    |> response(200)

    assert response =~ Phoenix.View.render_to_string(AnyGymWeb.VisitView, "show.html", visit: visit)
  end
end
