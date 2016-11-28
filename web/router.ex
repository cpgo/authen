defmodule Authen.Router do
  use Authen.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :api do
    plug :accepts, ["json"]
  end


  scope "/", Authen do
    pipe_through :browser
    coherence_routes
  end

  scope "/", Authen do
    pipe_through :protected
    coherence_routes :protected
  end


  scope "/", Authen do
    pipe_through :protected
    resources "/", TransactionsController

    # add protected resources below
    # resources "/privates", MyProject.PrivateController
  end


  # Other scopes may use custom stacks.
  # scope "/api", Authen do
  #   pipe_through :api
  # end
end
