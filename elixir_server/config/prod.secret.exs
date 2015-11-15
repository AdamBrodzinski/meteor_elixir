use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :chatty, Chatty.Endpoint,
  #secret_key_base: "MeDuhccgUDkkBmBTcXufvsefYI8dWcHJUkIq+MY17om97qM1VIQjMjktFPKEVsq9"
  secret_key_base: System.get_env("SECRET_KEY_BASE")

config :chatty, Chatty.Repo,
  database: "chatty",
  username: "testuser",
  password: "testpassword",
  #hostname: "candidate.16.mongolayer.com:11213,candidate.57.mongolayer.com"
  hostname: "candidate.16.mongolayer.com",
  port: "11213"
  #hostname: System.get_env("DATABASE_HOST")

