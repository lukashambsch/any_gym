defmodule AnyGymWeb.GymLocationTest do
  use AnyGym.DataCase

  alias AnyGym.GymLocation

  @valid_attrs %{
    in_network: true,
    location_name: "24 Hour Fitness",
    monthly_membership_fee: 24.99,
    phone_number: "6191234567",
    website_url: "http://test.com",
    address_id: 1
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = GymLocation.changeset(%GymLocation{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = GymLocation.changeset(%GymLocation{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "location_name is required" do
    attrs = %{@valid_attrs | location_name: ""}
    changeset = GymLocation.changeset(%GymLocation{}, attrs)
    assert "can't be blank" in errors_on(changeset).location_name
  end

  test "monthly_membership_fee is required" do
    attrs = %{@valid_attrs | monthly_membership_fee: nil}
    changeset = GymLocation.changeset(%GymLocation{}, attrs)
    assert "can't be blank" in errors_on(changeset).monthly_membership_fee
  end

  test "website_url is required" do
    attrs = %{@valid_attrs | website_url: ""}
    changeset = GymLocation.changeset(%GymLocation{}, attrs)
    assert "can't be blank" in errors_on(changeset).website_url
  end

  test "phone_number is required" do
    attrs = %{@valid_attrs | phone_number: ""}
    changeset = GymLocation.changeset(%GymLocation{}, attrs)
    assert "can't be blank" in errors_on(changeset).phone_number
  end

  test "phone_number can't be less than 10 digits" do
    attrs = %{@valid_attrs | phone_number: "123456789"}
    changeset = GymLocation.changeset(%GymLocation{}, attrs)
    assert "should be at least 10 character(s)" in errors_on(changeset).phone_number
  end

  test "phone_number can't be greater than 10 digits" do
    attrs = %{@valid_attrs | phone_number: "12345678901"}
    changeset = GymLocation.changeset(%GymLocation{}, attrs)
    assert "should be at most 10 character(s)" in errors_on(changeset).phone_number
  end
end
