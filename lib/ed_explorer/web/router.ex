defmodule EdExplorer.Web.Router do
  use EdExplorer.Web, :router

  require Logger

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EdExplorer.Web do
    pipe_through :browser

    get "/", PageController, :index

    resources "/users", UserController
  end

  scope "/auth", EdExplorer do
    pipe_through :browser

    get "/", AuthController, :index
    get "/callback", AuthController, :callback
    get "/logout", AuthController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", EdExplorer.Web do
  #   pipe_through :api
  # end

  # Fetch the current user from the session and add it to `conn.assigns`. This
  # will allow you to have access to the current user in your views with
  # `@current_user`.
  def assign_current_user(conn, _) do
    user = get_session(conn, :current_user)
    Logger.debug(fn -> "Current user = #{inspect user}" end)

    assign(conn, :current_user, user)
  end
end
