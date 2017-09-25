defmodule AnyGymWeb.VisitController do
  use AnyGymWeb, :controller

  def list(conn, _params) do
    render conn, "list.html"
  end

  def detail(conn, %{"visit_id" => visit_id}) do
    render conn, "detail.html", visit: visit_id
  end
end
