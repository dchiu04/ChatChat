defmodule Chatchat.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :body, :string
    field :date, :string
    field :name, :string
    field :room, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name, :body, :room, :date])
    |> validate_required([:name, :body, :room, :date])
  end
end
