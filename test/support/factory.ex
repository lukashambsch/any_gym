defmodule AnyGym.Factory do
  use ExMachina.Ecto, repo: AnyGym.Repo

  def user_factory do
    %AnyGym.User{
      email: sequence(:email, &"email-#{&1}@gmail.com"),
      name: sequence("User Name")
    }
  end

  def member_factory do
    %AnyGym.Member{
      first_name: sequence("First"),
      last_name: sequence("Last"),
      user: build(:user)
    }
  end

  def status_factory do
    %AnyGym.Status{
      status_name: sequence("Status Name")
    }
  end

  def gym_location_factory do
    %AnyGym.GymLocation{
      location_name: sequence("Location Name"),
      monthly_membership_fee: :rand.uniform(50),
      phone_number: sequence("123456789"),
      website_url: sequence(:website_url, &"http://url#{&1}.com"),
      user: build(:user)
    }
  end

  def visit_factory do
    %AnyGym.Visit{
      status: build(:status),
      member: build(:member),
      gym_location: build(:gym_location)
    }
  end
end
