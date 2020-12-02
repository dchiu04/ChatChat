defmodule Chatchat.Repo.Migrations.CreateTextmessages do
  use Ecto.Migration

  def change do
    create table(:textmessages) do
      add :name, :string
      add :date, :string
      add :message, :string
      add :room, :string

      timestamps()
    end

  end
end
