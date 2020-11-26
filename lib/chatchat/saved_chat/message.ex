defmodule Chatchat.SavedChat.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :date, :utc_datetime
    field :msg, :string
    field :name, :string
    field :room_id, :integer
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:user_id, :room_id, :name, :msg, :date])
    |> validate_required([:user_id, :room_id, :name, :msg, :date])
  end
end
