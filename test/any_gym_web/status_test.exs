defmodule AnyGymWeb.StatusTest do
  use AnyGym.DataCase

  alias AnyGym.Status

  @valid_attrs %{status_name: "Pending"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Status.changeset(%Status{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Status.changeset(%Status{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "status_name is required" do
    attrs = %{@valid_attrs | status_name: ""}
    changeset = Status.changeset(%Status{}, attrs)
    assert "can't be blank" in errors_on(changeset).status_name
  end
end
