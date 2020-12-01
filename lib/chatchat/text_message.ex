defmodule Chatchat.TextMessage do
  use Ecto.Schema
  import Ecto.Changeset

  schema "textmessages" do
    field :date, :string
    field :message, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(text_message, attrs) do
    text_message
    |> cast(attrs, [:name, :date, :message])
    |> validate_required([:name, :date, :message])
  end

  def get_messages(limit \\ 20) do
    Chatchat.Repo.all(Chatchat.TextMessage, limit: limit)
  end

end
