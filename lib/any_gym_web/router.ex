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

  pipeline :login_required do
    plug Guardian.Plug.EnsureAuthenticated,
         handler: AnyGymWeb.GuardianErrorHandler
  end

  pipeline :admin_required do
  end

  scope "/", AnyGymWeb do
    pipe_through [:browser, :with_session] # Use the default browser stack

    get "/", PageController, :index

    resources "/users", UserController, only: [:new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]

    scope "/" do
      pipe_through [:login_required]

      resources "/users", UserController, only: [:show]

      scope "/gym" do
        get "/visits", VisitController, :index
        get "/visits/:visit_id", VisitController, :show
      end

      scope "/admin", Admin, as: :admin do
        pipe_through [:admin_required]

        resources "/users", UserController, only: [:index, :show]
      end
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", AnyGymWeb do
  #   pipe_through :api
  # end
end
