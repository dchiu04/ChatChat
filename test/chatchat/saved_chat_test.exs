defmodule Chatchat.SavedChatTest do
  use Chatchat.DataCase

  alias Chatchat.SavedChat

  describe "messages" do
    alias Chatchat.SavedChat.Message

    @valid_attrs %{date: "2010-04-17T14:00:00Z", msg: "some msg", name: "some name", room_id: 42, user_id: 42}
    @update_attrs %{date: "2011-05-18T15:01:01Z", msg: "some updated msg", name: "some updated name", room_id: 43, user_id: 43}
    @invalid_attrs %{date: nil, msg: nil, name: nil, room_id: nil, user_id: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SavedChat.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert SavedChat.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert SavedChat.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = SavedChat.create_message(@valid_attrs)
      assert message.date == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert message.msg == "some msg"
      assert message.name == "some name"
      assert message.room_id == 42
      assert message.user_id == 42
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SavedChat.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, %Message{} = message} = SavedChat.update_message(message, @update_attrs)
      assert message.date == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert message.msg == "some updated msg"
      assert message.name == "some updated name"
      assert message.room_id == 43
      assert message.user_id == 43
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = SavedChat.update_message(message, @invalid_attrs)
      assert message == SavedChat.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = SavedChat.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> SavedChat.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = SavedChat.change_message(message)
    end
  end
end
