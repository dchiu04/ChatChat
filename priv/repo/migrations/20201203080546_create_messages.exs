defmodule Chatchat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :name, :string
      add :body, :text
      add :room, :string
      add :date, :string

      timestamps()
    end

  end
end

