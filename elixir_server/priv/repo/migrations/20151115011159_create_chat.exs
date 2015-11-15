defmodule Chatty.Repo.Migrations.CreateChat do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :title, :string
      add :message, :string
      add :time, :integer

      timestamps
    end

  end
end
