defmodule AnyGymWeb.VisitView do
  use AnyGymWeb, :view

  def format_date_time(datetime) do
    elem(Timex.format(datetime, "{YYYY}-{M}-{D} {h12}:{m} {AM}"), 1)
  end
end
