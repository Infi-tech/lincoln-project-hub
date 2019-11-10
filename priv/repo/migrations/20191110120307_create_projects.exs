defmodule LincolnProjectHub.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :name, :string
      add :description, :string
      add :start_date, :string
      add :end_date, :string

      timestamps()
    end

  end
end
