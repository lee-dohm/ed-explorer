# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ed_explorer,
  ecto_repos: [EdExplorer.Repo]

# Configures the endpoint
config :ed_explorer, EdExplorer.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pbmNa/1/l88hXRrLFFCPPg4lAFEIrqb/PcwDO8Uz4toaAmjJ2nXMyirZK7b2xSH8",
  render_errors: [view: EdExplorer.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: EdExplorer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

config :ed_explorer, :generators,
  migration: true,
  binary_id: true,
  sample_binary_id: "11111111-1111-1111-1111-111111111111"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
