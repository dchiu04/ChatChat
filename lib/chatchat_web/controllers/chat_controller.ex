defmodule ChatchatWeb.ChatController do
  use ChatchatWeb, :controller

  def show(conn, %{"id" => room}) do
    messages = Chatchat.Chats.list_messages_by_room(room)
    render(conn, "show.html", room: room, messages: messages)
  end
end
