defmodule ChatchatWeb.PageController do
  use ChatchatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
