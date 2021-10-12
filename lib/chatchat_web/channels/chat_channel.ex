defmodule ChatchatWeb.ChatChannel do
  use ChatchatWeb, :channel

  @impl true
  def join("chat:" <> _room, _payload, socket) do
    {:ok, socket}
  end

  #handles channel.push() and recieves payload
  def handle_in("shout", payload, socket) do
    "chat:" <> room = socket.topic
    
    #adds room to the end of the payload
    payload = Map.merge(payload, %{"room" => room})

    #payload is sent to the repo 
    Chatchat.Chats.create_message(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end
end
