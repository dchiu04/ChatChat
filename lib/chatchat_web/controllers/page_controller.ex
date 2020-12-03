defmodule ChatchatWeb.PageController do
  use ChatchatWeb, :controller

  plug :action
  
  def index(conn, _params) do
    render(conn, "index.html")
  end
end
