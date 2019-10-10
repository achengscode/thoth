defmodule ThothWeb.Router do
  use ThothWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

    # LiveView plugs
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ThothWeb do
    pipe_through :browser

    # get "/", PageController, :index
    get "/", ThothController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ThothWeb do
  #   pipe_through :api
  # end
end
