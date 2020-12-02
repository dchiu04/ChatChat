defmodule ChatchatWeb.RoomChannel do
    use Phoenix.Channel

    def join("room:lobby", payload, socket) do
        if authorized?(payload) do
          send(self(), :after_join)
          {:ok, socket}
        else
          {:error, %{reason: "unauthorized"}}
        end
    end

    # def join("room:lobby", _message, socket) do
    #     {:ok, socket}
    # end

    # def handle_in("new_msg", %{"body" => body}, socket) do
    #     broadcast!(socket, "new_msg", %{body: body})
    #     {:noreply, socket}
    # end

    # def handle_in("new_msg", payload, socket) do
    #     broadcast!(socket, "new_msg", payload)
    #     {:noreply, socket}
    # end

    #not sure about this
    @spec handle_in(<<_::32, _::_*24>>, any, any) ::
            {:noreply, Phoenix.Socket.t()} | {:reply, {:ok, any}, any}
    def handle_in("ping", payload, socket) do
        {:reply, {:ok, payload}, socket}
      end

    def handle_in("new_msg", payload, socket) do
        "room:" <> room = socket.topic
        payload = Map.merge(payload, %{"room" => room})
        Chatchat.TextMessage.changeset(%Chatchat.TextMessage{}, payload) |> Chatchat.Repo.insert()
        broadcast!(socket, "new_msg", payload)
        {:noreply, socket}
    end

    # Add authorization logic here as required.
    defp authorized?(_payload) do
        true
    end

    @impl true
    def handle_info(:after_join, socket) do
        Chatchat.TextMessage.get_messages()
        |> Enum.each(fn msg -> push(socket, "new_msg", %{
            name: msg.name,
            date: msg.date,
            message: msg.message,
          }) end)
        # user = socket.assigns.user
        # {:ok, _} = ChatchatWeb.Presence.track(socket, user.id, %{
        #   username: user.name
        # })
        # push(socket, "presence_state", ChatchatWeb.Presence.list(socket))
        {:noreply, socket} # :noreply
      end

end
