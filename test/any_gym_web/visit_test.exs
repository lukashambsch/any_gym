defmodule AnyGymWeb.VisitTest do
  use AnyGym.DataCase

  alias AnyGym.Visit
  alias AnyGym.Repo

  @valid_attrs %{member_id: 1, status_id: 1, gym_location_id: 1}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Visit.changeset(%Visit{}, @valid_attrs)
    IO.puts changeset.errors
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Visit.changeset(%Visit{}, @invalid_attrs)
    assert_raise Postgrex.Error, fn ->
      Repo.insert!(changeset)
    end
  end
end
