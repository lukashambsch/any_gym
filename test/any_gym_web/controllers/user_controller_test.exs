defmodule AnyGymWeb.UserControllerTest do
  use AnyGymWeb.ConnCase, async: true

  test "show/2 responds with user show page" do
    user = insert(:user)
    response = build_conn()
    |> AnyGymWeb.Auth.login(user)
    |> get(user_path(build_conn(), :show, user.id))
    |> response(200)

    assert response =~ Phoenix.View.render_to_string(AnyGymWeb.UserView, "show.html", user: user)
  end

  test "new/2 shows new user page" do
    response = build_conn()
    |> get(user_path(build_conn(), :new))
    |> response(200)

    assert response =~ "User Registration"
  end

end
