defmodule ThothWeb.ThothController do
  use ThothWeb, :controller

  def index(conn, _params) do
    live_render(conn, ThothWeb.ThothLiveView)
  end
end
