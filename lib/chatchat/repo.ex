defmodule Chatchat.Repo do
  use Ecto.Repo,
    otp_app: :chatchat,
    adapter: Ecto.Adapters.Postgres
end
