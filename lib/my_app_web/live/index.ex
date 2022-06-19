defmodule MyAppWeb.Index do
  use Surface.LiveView

  import MyApp.StateSearch
  alias MyAppWeb.Components.Hero
  alias MyAppWeb.Components.Tiles.Search

  def handle_info({:search, search_phrase}, socket) do
    IO.inspect("Search for: #{search_phrase}")
    :timer.sleep(5000)

    socket =
      socket
      |> put_flash(:info, "Searching results")
      |> assign(
        search_results: search_for_state(search_phrase),
        search_phrase: search_phrase,
        loading: false
      )

    IO.inspect(socket.assigns)
    {:noreply, socket}
  end
end
