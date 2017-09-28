defmodule AnyGym.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias AnyGym.User


  schema "users" do
    field :email, :string
    field :is_admin, :boolean, default: false
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, [:email, :name, :is_admin])
    |> validate_required([:email, :name, :is_admin])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, message: "This email is already being used.")
  end

  def registration_changeset(%User{} = user, attrs \\ %{}) do
    user
    |> changeset(attrs)
    |> cast(attrs, ~w(password)a, [])
    |> validate_length(:password, min: 6, max: 100)
    |> hash_password
  end

  def hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true,
                      changes: %{password: password}} ->
        put_change(changeset,
                   :password_hash,
                   Comeonin.Argon2.hashpwsalt(password))
      _ ->
        changeset
    end
  end
end
