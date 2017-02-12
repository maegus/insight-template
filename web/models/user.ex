defmodule Insight.User do
  use Insight.Web, :model

  schema "users" do
    field :email, :string
    field :name, :string
    field :avatar, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name, :avatar])
    |> validate_required([:email, :name, :avatar])
  end
end
