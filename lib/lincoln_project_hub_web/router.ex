defmodule LincolnProjectHubWeb.Router do
  use LincolnProjectHubWeb, :router

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

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: LincolnProjectHubWeb.AuthErrorHandler
  end

  pipeline :not_authenticated do
    plug Pow.Plug.RequireNotAuthenticated,
      error_handler: LincolnProjectHubWeb.AuthErrorHandler
  end

  scope "/", LincolnProjectHubWeb do
    pipe_through [:browser, :not_authenticated]

    get "/", PageController, :index
    get "/signup", RegistrationController, :new, as: :signup
    post "/signup", RegistrationController, :create, as: :signup
    get "/login", SessionController, :new, as: :login
    post "/login", SessionController, :create, as: :login
  end

  scope "/", LincolnProjectHubWeb do
    pipe_through [:browser, :protected]

    delete "/logout", SessionController, :delete, as: :logout
  end

  # Other scopes may use custom stacks.
  # scope "/api", LincolnProjectHubWeb do
  #   pipe_through :api
  # end
end
