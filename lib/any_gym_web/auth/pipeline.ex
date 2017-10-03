defmodule AnyGymWeb.Guardian.AuthPipeline.Session do
  use Guardian.Plug.Pipeline, otp_app: :any_gym,
                              module: AnyGymWeb.Guardian,
                              error_handler: AnyGymWeb.GuardianErrorHandler
  plug Guardian.Plug.VerifySession
  plug Guardian.Plug.LoadResource, allow_blank: true
end

defmodule AnyGymWeb.Guardian.AuthPipeline.Login do
  use Guardian.Plug.Pipeline, otp_app: :any_gym,
                              module: AnyGymWeb.Guardian,
                              error_handler: AnyGymWeb.GuardianErrorHandler

  plug Guardian.Plug.EnsureAuthenticated
end
