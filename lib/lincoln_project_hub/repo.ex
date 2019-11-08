defmodule LincolnProjectHub.Repo do
  use Ecto.Repo,
    otp_app: :lincoln_project_hub,
    adapter: Ecto.Adapters.Postgres
end
