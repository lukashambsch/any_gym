defmodule AnyGymWeb.PageController do
  use AnyGymWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
