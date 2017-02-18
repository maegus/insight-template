defmodule Insight.UserTest do
  use Insight.ModelCase

  alias Insight.User

  @valid_attrs %{email: "i@draveness.me", name: "some content"}
  @invalid_attrs %{email: "i#draveness.me", name: "ABC"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
