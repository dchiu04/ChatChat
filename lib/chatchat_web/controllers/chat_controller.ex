defmodule ChatchatWeb.ChatController do
  use ChatchatWeb, :controller

  plug :action
  
  def show(conn, %{"id" => room}) do
    IO.puts("********************inside SHOW ***************************")
    messages = Chatchat.Chats.list_messages_by_room(room)
    render(conn, "show.html")
  end
end
