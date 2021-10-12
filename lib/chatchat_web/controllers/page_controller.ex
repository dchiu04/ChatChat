defmodule ChatchatWeb.PageController do
  use ChatchatWeb, :controller

  def index(conn, _params) do
    messages = Chatchat.Chats.list_messages_by_room("Main")
    render(conn, "index.html",  room: "Main Lobby", messages: messages)
  end
end
