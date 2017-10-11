defmodule AnyGymWeb.VisitControllerTest do
  use AnyGymWeb.ConnCase, async: true

  test "index/3 responds with visit index page" do
    visit = insert(:visit)
    conn = build_conn()
    |> AnyGymWeb.Auth.login(visit.gym_location.user)

    response = conn
    |> get(visit_path(conn, :index))
    |> response(200)

    assert response =~ Phoenix.View.render_to_string(AnyGymWeb.VisitView, "index.html", visits: [visit])
  end

  test "show/3 responds with visit show page" do
    visit = insert(:visit)
    conn = build_conn()
    |> AnyGymWeb.Auth.login(visit.gym_location.user)

    response = conn
    |> get(visit_path(conn, :show, visit.id))
    |> response(200)

    assert response =~ Phoenix.View.render_to_string(AnyGymWeb.VisitView, "show.html", visit: visit)
  end
end
