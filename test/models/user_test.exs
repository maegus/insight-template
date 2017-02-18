defmodule Insight.UserTest do
  use Insight.ModelCase

  alias Insight.User

  @valid_attrs %{email: "i@draveness.me", name: "some content", password: "password"}
  @invalid_attrs %{email: "i#draveness.me", name: "ABC", password: "pass"}

  test "registration_changeset with valid attributes" do
    changeset = User.registration_changeset(%User{}, @valid_attrs)
    assert changeset.changes.password_hash
    assert changeset.valid?
  end

  test "registration_changeset with invalid attributes" do
    changeset = User.registration_changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "update_changeset with valid name" do
    changeset = User.update_changeset(%User{}, %{name: "Draven"})
    assert changeset.valid?
  end

  test "update_changeset with invalid name" do
    changeset = User.update_changeset(%User{}, %{name: String.duplicate("a", 3)})
    refute changeset.valid?
    changeset = User.update_changeset(%User{}, %{name: String.duplicate("a", 17)})
    refute changeset.valid?
  end

  test "update_changeset with valid password" do
    changeset = User.update_changeset(%User{}, %{password: "password"})
    assert changeset.valid?
  end

  test "update_changeset with invalid password" do
    changeset = User.update_changeset(%User{}, %{password: "pass"})
    refute changeset.valid?
  end

end
