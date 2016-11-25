# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :authen,
  ecto_repos: [Authen.Repo]

# Configures the endpoint
config :authen, Authen.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dV6RDs/+e2yV7tm+JpxqcKfrtTnqwgaf+R5yTl4cRB6jY976Xc/BJo6r2IZHyW19",
  render_errors: [view: Authen.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Authen.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :addict,
  secret_key: "243262243132244c6e324f316e4641556f356447744d466e6b78503065",
  extra_validation: fn ({valid, errors}, user_params) -> {valid, errors} end, # define extra validation here
  user_schema: Authen.User,
  repo: Authen.Repo,
  from_email: "no-reply@example.com", # CHANGE THIS
mail_service: nil