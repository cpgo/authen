defmodule Authen.LayoutView do
  use Authen.Web, :view

  def current_user(%{assigns: %{current_user: user}}) do
    user
  end

  def current_user(nil) do
    false
  end

  def money_format(nil) do
    Money.new 0
  end

  def money_format(value) do
    Money.new value
  end

end
