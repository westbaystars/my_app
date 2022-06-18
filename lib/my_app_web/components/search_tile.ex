defmodule MyAppWeb.Components.SearchTile do
  @moduledoc """
  A Bulma based tile for searching with type-ahead.
  """

  use Surface.LiveComponent

  alias Surface.Components.Form
  alias Surface.Components.Form.{Submit}
  alias MyAppWeb.Components.Form.TextInput
  alias SurfaceFontAwesome.Icon, as: FA
  #alias SurfaceBulma.Form.TextInput
#  alias ScoutDragonWeb.Components.Form.TextInput
#  alias ScoutDragon.ExistClient, as: Exist

  @doc "The value to search for"
  prop value, :string, default: ""

  @doc "The color"
  prop color, :string,
    values!: ["danger", "info", "warning", "primary", "success", "link"],
    default: "info"

  data search_results, :any, default: []

  data loading, :boolean, default: false

  def search(""), do: []

  @max_results 20

  def search(name) do
    IO.inspect("search called with '#{name}'")

    if String.length(name) >= 3
        || String.to_charlist(name) |> Enum.any?(fn n -> n >= 1024 end) do
      Exist.player_name_search(name)
      |> Enum.sort()
      |> Enum.take(@max_results)
    else
      []
    end
  end

  def handle_event("search", %{"name" => search_phrase}, socket) do
    IO.inspect("Search for: #{search_phrase}")

#    send_update(TextInput, id: "name-search", loading: true)

    search_results = search(search_phrase)
    socket =
      socket
      |> clear_flash()
      |> assign(search_results: search_results, loading: false)

#    send_update(TextInput, id: "name-search", loading: false)

    {:noreply, socket}
  end

  def handle_event("pick", %{"name" => _search_phrase}, socket) do
    assigns = [
      search_results: [],
    ]

    {:noreply, assign(socket, assigns)}
  end

end
