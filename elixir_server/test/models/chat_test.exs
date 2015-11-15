defmodule Chatty.ChatTest do
  use Chatty.ModelCase

  alias Chatty.Chat

  @valid_attrs %{message: "some content", time: 42, title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Chat.changeset(%Chat{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Chat.changeset(%Chat{}, @invalid_attrs)
    refute changeset.valid?
  end
end
