defmodule MyAppWeb.Components.Tiles.Search do
  @moduledoc """
  A Bulma based tile for searching with type-ahead.
  """

  use Surface.LiveComponent

  import MyApp.StateSearch

  alias Surface.Components.{Form}
  alias MyAppWeb.Components.{Button}
  alias MyAppWeb.Components.Form.{TextInput}
  alias SurfaceFontAwesome.Icon, as: FA

  @doc "The ID of the search input field."
  #prop id, :string, default: "search"

  @doc "The value to search for."
  prop value, :string, default: ""

  @doc "The color."
  prop color, :string,
    values!: ["danger", "info", "warning", "primary", "success", "link"],
    default: "info"

  prop search_results, :any, default: []

  @doc "Additional classes set by parent."
  prop class, :css_class

  data loading, :boolean, default: false

  def handle_event("search", %{"value" => search_phrase}, socket) do
    IO.inspect("Search for: #{search_phrase}")
    :timer.sleep(5000)

    assigns = [
      search_results: search_for_state(search_phrase),
      search_phrase: search_phrase
    ]

    {:noreply, assign(socket, assigns)}
  end

  def handle_event("pick", %{"name" => search_phrase}, socket) do
    assigns = [
      search_results: [],
      search_phrase: search_phrase
    ]

    {:noreply, assign(socket, assigns)}
  end
end
