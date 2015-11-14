defmodule Chatty.Repo do
 use Ecto.Repo,
    otp_app: :chatty,
    adapter: Mongo.Ecto
end
