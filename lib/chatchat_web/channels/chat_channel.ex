defmodule ChatchatWeb.ChatChannel do
  use ChatchatWeb, :channel

  @impl true
  def join("chat:" <> _room, _payload, socket) do
    # send(self(), :after_join)
    # {:ok, %{channel: "room:#{room}"}, assign(socket, :room, room)}
    {:ok, socket}
  end

  def handle_in("shout", payload, socket) do
    "chat:" <> room = socket.topic
    payload = Map.merge(payload, %{"room" => room})
    Chatchat.Chats.create_message(payload)
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # def handle_info(:after_join, socket) do
  #   push socket, "presence_state", ChatchatWeb.Presence.list(socket)
  #   user = Chatchat.Repo.get(Message, socket.assigns[:current_user_id])

  #   # {:ok, _} = ChatchatWeb.Presence.track(socket, "user:#{user.id}", %{
  #   #   user_id: user.id,
  #   #   username: user.username
  #   # })

  #   {:noreply, socket}
  # end

end
