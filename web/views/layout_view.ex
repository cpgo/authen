defmodule Authen.LayoutView do
  use Authen.Web, :view

  def current_user(%{assigns: %{current_user: user}}) do
    user
  end

  def current_user(nil) do
    false
  end

end
