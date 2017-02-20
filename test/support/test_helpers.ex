defmodule Insight.TestHelpers do
  alias Insight.Repo
  alias Insight.User
  alias Insight.Session

  def insert_user(attrs \\ %{}) do
    changes = Dict.merge(%{
      name: "Draven",
      email: "user@email.com",
      password: "supersecret"
      }, attrs)

    %User{}
    |> User.registration_changeset(changes)
    |> Repo.insert!
  end

  def insert_session(user) do
    %Session{}
    |> Session.create_changeset(%{user_id: user.id})
    |> Repo.insert!
  end
end
