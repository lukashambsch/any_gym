defmodule AnyGymWeb.VisitControllerTest do
  use AnyGymWeb.ConnCase, async: true

  test "index/3 responds with location index page" do
    visit = insert(:visit)
    conn = build_conn()
    |> AnyGymWeb.Auth.login(visit.gym_location.user)

    response = conn
    |> get(visit_path(conn, :index))
    |> response(200)
  end
end
