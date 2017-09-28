defmodule AnyGymWeb.Router do
  use AnyGymWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :with_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug AnyGymWeb.CurrentUser
  end

  scope "/", AnyGymWeb do
    pipe_through [:browser, :with_session] # Use the default browser stack

    get "/", PageController, :index
    get "/gym/visits", VisitController, :list
    get "/gym/visits/:visit_id", VisitController, :detail

    resources "/users", UserController, only: [:show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", AnyGymWeb do
  #   pipe_through :api
  # end
end
