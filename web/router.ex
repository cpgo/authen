defmodule Authen.Router do
  use Authen.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Openmaize.Authenticate
    # plug Authen.Authorize.user_check
  end

  scope "/", Authen do
    pipe_through :browser

    get "/", PageController, :index

    resources "/users", UserController
    resources "/products", ProductController
    resources "/sessions", SessionController, only: [:new, :create, :delete]


  end

end
