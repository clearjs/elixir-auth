# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :psf, PsfWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "nIApnPrnvgEHWgUcA7XkMSolDWhiKx8kF7ncWY739RlQJ0WyMVnC+AfuL6+JAOs4",
  render_errors: [view: PsfWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Psf.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
