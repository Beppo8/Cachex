defmodule TeacherWeb.RoomChannel do
  use TeacherWeb, :channel

  @messages ["You liked: ", "Thanks for liking: "]

  def join("room:lobby", payload, socket) do
    socket = socket
      |> assign(:message, Enum.random(@messages))
      |> assign(:albums, [])
    {:ok, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (room:lobby).
  def handle_in("shout", payload, socket) do
    new_album = payload["album"]
    socket = assign(socket, :albums, socket.assigns.albums ++ [new_album])
    broadcast socket, "shout", socket.assigns
    {:noreply, socket}
  end
end
