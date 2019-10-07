defmodule ThothWeb.PageController do
  use ThothWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
