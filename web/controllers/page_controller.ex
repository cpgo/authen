defmodule Authen.PageController do
  use Authen.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
