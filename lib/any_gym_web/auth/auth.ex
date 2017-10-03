defmodule AnyGymWeb.Auth do
  import Comeonin.Argon2, only: [checkpw: 2, dummy_checkpw: 0]

  alias AnyGym.User
  alias AnyGym.Repo

  def login(conn, user) do
    conn
    |> AnyGymWeb.Guardian.Plug.sign_in(user)
  end

  def login_by_email_and_password(conn, email, given_pass) do
    user = Repo.get_by(User, email: email)

    cond do
      user && checkpw(given_pass, user.password_hash) ->
        {:ok, login(conn, user)}
      user ->
        {:error, :unauthorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

  def logout(conn) do
    AnyGymWeb.Guardian.Plug.sign_out(conn)
  end
end
