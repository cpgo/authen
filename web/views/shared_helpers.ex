defmodule Authen.SharedHelpers do
  use Authen.Web, :view

  def date_select_br(form, field, opts \\ [day: [class: "select"], year: [class: "select"], month: [class: "select"]]) do
    builder = fn b ->
      ~e"""
        <%= b.(:day, []) %> / <%= b.(:month, []) %> / <%= b.(:year, []) %>
      """
    end

    date_select(form, field, [builder: builder] ++ opts)
  end
end
