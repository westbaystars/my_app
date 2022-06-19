defmodule MyAppWeb.Components.Button do
  @moduledoc """
  The text field component as defined here: https://bulma.io/documentation/form/input/
  """

  use Surface.Component

  @doc "Additional classes set by parent."
  prop class, :string

  @doc "The color"
  prop color, :string, values!: ["danger", "info", "warning", "primary"], default: "info"

  slot default

  def render(assigns) do
    ~F"""
    <button class={"button", "is-#{@color}", @class}>
      <#slot />
    </button>
    """
  end
end
