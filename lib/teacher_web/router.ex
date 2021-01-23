defmodule TeacherWeb.Router do
  use TeacherWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TeacherWeb do
    pipe_through :browser # Use the default browser stack

    get "/", AlbumController, :index
    resources "/albums", AlbumController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TeacherWeb do
  #   pipe_through :api
  # end
end
