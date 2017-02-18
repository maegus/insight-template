defmodule Insight.User do
  use Insight.Web, :model

  schema "users" do
    field :email, :string, unique: true
    field :name, :string
    field :avatar, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  def registration_changeset(model, params) do
    model
    |> cast(params, [:password, :email, :name, :avatar])
    |> validate_required([:password, :email])
    |> validate_email
    |> validate_password_length
    |> validate_name_length
    |> put_pass_hash
  end

  def update_changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :avatar, :password])
    |> validate_password_length
    |> validate_name_length
    |> put_pass_hash
  end

  defp validate_email(model) do
    model
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
  end

  defp validate_name_length(model) do
    model
    |> validate_length(:name, min: 4, max: 16)
  end

  defp validate_password_length(model) do
    model
    |> validate_length(:password, min: 6, max: 16)
  end

  defp put_pass_hash(model) do
    case model do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(model, :password_hash, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        model
    end
  end
end
