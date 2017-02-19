defmodule Insight.SessionView do
  use Insight.Web, :view

  def render("error.json", _params) do
    %{errors: %{user: "invalid email/password combination"}}
  end

  def render("show.json", %{session: session}) do
    %{data: render_one(session, Insight.SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{user_id: session.user_id,
      token: session.token}
  end
end
