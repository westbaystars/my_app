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
  # prop id, :string, default: "search"

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

  # Handle autocomplete searching when a value is specified.
  def update(%{value: value} = assigns, socket) when byte_size(value) > 0 do
    # IO.inspect("Search for: #{value}")
    :timer.sleep(3000)    # Time delay to see it working

    socket =
      socket
      |> assign(
        search_results: search_for_state(value),
        loading: false
      )

    # IO.inspect(socket.assigns)
    {:ok, assign(socket, assigns)}
  end

  # Pass through all assigns without doing anything.
  def update(assigns, socket) do
    # IO.inspect("Update assigns: #{inspect(assigns)}")
    {:ok, assign(socket, assigns)}
  end

  def handle_event("search", %{"value" => value}, socket) do
    send_update(__MODULE__, id: "search", value: value, loading: false)

    {:noreply, assign(socket, loading: true)}
  end

  def handle_event("pick", %{"value" => value}, socket) do
    assigns = [
      search_results: [],
      value: value
    ]

    {:noreply, assign(socket, assigns)}
  end
end
