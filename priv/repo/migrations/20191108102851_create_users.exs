defmodule LincolnProjectHub.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :password_hash, :string
      add :first_name, :string
      add :last_name, :string
      add :age, :string
      add :class, :string
      add :school, :string
      add :guardian_name, :string
      add :guardian_phone, :string
      add :guardian_email, :string
      add :emargency_name, :string
      add :emergency_phone, :string
      add :role, :string, default: "ambassador"

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
