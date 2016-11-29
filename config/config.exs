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

config :money,
  default_currency: :BRL,
  separator: ".",
  delimeter: ",",
  symbol: true,
  symbol_on_right: false,
  symbol_space: true
# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Authen.User,
  repo: Authen.Repo,
  module: Authen,
  logged_out_url: "/",
  email_from_name: "Cassio Godinho",
  email_from_email: "cassiopgodinho@gmail.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :registerable, :rememberable]

config :coherence, Authen.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
