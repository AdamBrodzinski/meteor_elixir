use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :chatty, Chatty.Endpoint,
  secret_key_base: "MeDuhccgUDkkBmBTcXufvsefYI8dWcHJUkIq+MY17om97qM1VIQjMjktFPKEVsq9"

config :chatty, Chatty.Repo,
  url: "mongodb://testuser:testpassword@candidate.16.mongolayer.com:11213,candidate.57.mongolayer.com:10138/chatty?replicaSet=set-56489fdcbab49bb86e000bfb"
