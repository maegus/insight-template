defmodule Insight.Session do
  use Insight.Web, :model

  schema "sessions" do
    field :token, :string
    belongs_to :user, Insight.User

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:user_id])
    |> validate_required([:user_id])
  end

  def create_changeset(model, params \\ %{}) do
    model
    |> changeset(params)
    |> put_change(:token, SecureRandom.urlsafe_base64())
  end
end
