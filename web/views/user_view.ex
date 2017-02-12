defmodule Insight.UserView do
  use Insight.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Insight.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Insight.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      name: user.name,
      avatar: user.avatar}
  end
end
