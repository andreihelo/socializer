# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :socializer,
  ecto_repos: [Socializer.Repo]

# Configures the endpoint
config :socializer, SocializerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "OeWE1NXLnoevjH9mjwQdZPfqMQuhGmb5z3sPNYjiUHTSSZpRhPnvln21sU3jTBf/",
  render_errors: [view: SocializerWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Socializer.PubSub,
  live_view: [signing_salt: "usG7BBzH"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
