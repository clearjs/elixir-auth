defmodule PsfWeb.Router do
  use PsfWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PsfWeb do
    pipe_through :api
  end
end
