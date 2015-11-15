defmodule Chatty.RoomChannel do
  use Chatty.Web, :channel
  alias Chatty.Chat

  def join("rooms:lobby", payload, socket) do
    if authorized?(payload) do
      data = %{"initialChats" => Repo.all(Chat)}
      {:ok, data, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  #def handle_info(:after_join, socket) do
    #IO.puts "handle info"
    #push socket, "user:entered", username: "Anon" #payload["message"] || "Anon"
    #{:noreply, socket}
  #end

  def handle_in("new_msg", payload, socket) do
    IO.inspect payload
    broadcast! socket, "new_msg", payload
    {:noreply, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (rooms:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # This is invoked every time a notification is being broadcast
  # to the client. The default implementation is just to push it
  # downstream but one could filter or change the event.
  def handle_out(event, payload, socket) do
    push socket, event, payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
