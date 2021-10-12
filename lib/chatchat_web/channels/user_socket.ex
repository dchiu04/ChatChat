defmodule ChatchatWeb.UserSocket do
  use Phoenix.Socket

  channel "chat:*", ChatchatWeb.ChatChannel
  
  @impl true
  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  # Returning `nil` makes this socket anonymous.
  @impl true
  def id(_socket), do: nil
end
