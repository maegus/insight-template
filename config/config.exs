# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :insight,
  ecto_repos: [Insight.Repo]

# Configures the endpoint
config :insight, Insight.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XPbBqeSs35cs2jVp9098um2vbW/9Wz9LLwrxhBFj+nvnuFpH0QG1HJakdl2CZxzx",
  render_errors: [view: Insight.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Insight.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :canary, repo: Insight.Repo,
  unauthorized_handler: {Insight.AuthorizationController, :handle_unauthorized}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
