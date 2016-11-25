defmodule Authen.Router do
  use Authen.Web, :router
  use Addict.RoutesHelper

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Addict.Plugs.Authenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Authen do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
  end

  scope "/" do
    addict(:routes)
  end

  # Other scopes may use custom stacks.
  # scope "/api", Authen do
  #   pipe_through :api
  # end
end
