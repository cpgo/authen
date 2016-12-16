defmodule Authen.TransactionView do
  use Authen.Web, :view
  import Authen.SharedHelpers, only: [date_select_br: 2]

  def span_status( %{status: %{id: 1, description: description}} ) do
    content_tag(:span, description, class: "bg-green")
  end

  def span_status( %{status: %{id: 2, description: description}} ) do
    content_tag(:span, description, class: "bg-red")
  end

  def span_status(transaction) do
    transaction.status.description
  end

  def row_class( %{type: %{id: 1}} ) do
    "green"
  end


  def row_class( %{type: %{id: 2}} ) do
    "red"
  end

  def money_format(value) do
    value
      |> Money.new
      |> Money.to_string
  end

end
