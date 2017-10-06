defmodule AnyGymWeb.UserTest do
  use AnyGym.DataCase

  alias AnyGym.User
  alias AnyGym.Repo

  @valid_attrs %{email: "test@gmail.com", is_admin: false, name: "Test User", password: "testpass"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "insert with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    user = Repo.insert!(changeset)
    assert user.id
  end

  test "insert with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    assert_raise Ecto.InvalidChangesetError, fn ->
      Repo.insert!(changeset)
    end
  end

  test "email is required" do
    attrs = %{@valid_attrs | email: ""}
    changeset = User.changeset(%User{}, attrs)
    assert "can't be blank" in errors_on(changeset).email
  end

  test "name is required" do
    attrs = %{@valid_attrs | name: ""}
    changeset = User.changeset(%User{}, attrs)
    assert "can't be blank" in errors_on(changeset).name
  end

  test "is_admin is required" do
    attrs = %{@valid_attrs | is_admin: nil}
    changeset = User.changeset(%User{}, attrs)
    assert "can't be blank" in errors_on(changeset).is_admin
  end

  test "email has to contain @ symbol" do
    attrs = %{@valid_attrs | email: "test"}
    changeset = User.changeset(%User{}, attrs)
    assert "has invalid format" in errors_on(changeset).email
  end

  test "email must be unique" do
    changeset = User.changeset(%User{}, @valid_attrs)
    Repo.insert!(changeset)
    second_changeset = User.changeset(%User{}, @valid_attrs)

    assert {:error, changeset} = Repo.insert(second_changeset)
    assert "This email is already being used." in errors_on(changeset).email
  end

  test "registration_changeset with valid attributes" do
    changeset = User.registration_changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "registration_changeset with invalid attributes" do
    changeset = User.registration_changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "password is required" do
    attrs = %{@valid_attrs | password: nil}
    changeset = User.registration_changeset(%User{}, attrs)
    assert %{password: ["can't be blank"]} = errors_on(changeset)
  end

  test "password must be longer that 6 characters" do
    attrs = %{@valid_attrs | password: "test"}
    changeset = User.registration_changeset(%User{}, attrs)
    assert %{password: ["should be at least 6 character(s)"]} = errors_on(changeset)
  end

  test "password hash is saved" do
    changeset = User.registration_changeset(%User{}, @valid_attrs)
    {:ok, user} = Repo.insert(changeset)
    assert user.password_hash
  end
end
