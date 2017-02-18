defmodule Insight.TestHelpers do
  alias Insight.Repo
  alias Insight.User

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
end
