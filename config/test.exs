import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_mishka_chelekom_sample, PhoenixMishkaChelekomSampleWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "4jEeeZ/cRN512plgmBBsEisHM/y9rUFIpukGJVOP0XcQCrWxlsPqb+8LDpnl9DAD",
  server: false

# In test we don't send emails
config :phoenix_mishka_chelekom_sample, PhoenixMishkaChelekomSample.Mailer,
  adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
