defmodule Chatty.Chat do
  use Chatty.Web, :model
  @required_fields ~w(username message time)
  @optional_fields ~w()
  @primary_key {:_id, :string, autogenerate: false}
  # only encode these fields to JSON else throw
  @derive {Poison.Encoder, only: [:_id, :username, :message, :time]}

  schema "chats" do
    field :username, :string
    field :message, :string
    field :time, :float
  end

  @doc """
  Creates a changeset based on the `model` and `params`.
  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
