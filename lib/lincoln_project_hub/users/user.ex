defmodule LincolnProjectHub.Users.User do
  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()
    field :first_name, :string
    field :last_name, :string
    field :age, :string
    field :class, :string
    field :school, :string
    field :guardian_name, :string
    field :guardian_phone, :string
    field :guardian_email, :string
    field :emargency_name, :string
    field :emergency_phone, :string
    field :role, :string, default: "ambassador"

    timestamps()
  end

  def changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> pow_changeset(attrs)
    |> changeset_role(attrs)
  end

  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(ambassador admin sup))
  end
end
