defmodule ChatchatWeb.RoomChannel do
    use Phoenix.Channel

    def join("room:lobby", _message, socket) do
        {:ok, socket}
    end

    # def handle_in("new_msg", %{"body" => body}, socket) do
    #     broadcast!(socket, "new_msg", %{body: body})
    #     {:noreply, socket}
    # end

    def handle_in("new_msg", payload, socket) do
        broadcast!(socket, "new_msg", payload)
        {:noreply, socket}
    end


    # def handle_in("new_msg", payload, socket) do
    #     Chatchat.Message.changeset(%Chat.Message{}, payload) |> Chat.Repo.insert  
    #     broadcast socket, "shout", payload
    #     {:noreply, socket}
    # end
end