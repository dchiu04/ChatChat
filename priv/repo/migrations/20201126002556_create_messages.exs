defmodule Chatchat.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :user_id, :integer
      add :room_id, :integer
      add :name, :string
      add :msg, :string
      add :date, :utc_datetime

      timestamps()
    end

  end
end
