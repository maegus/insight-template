defmodule Insight.SessionView do
  use Insight.Web, :view

  def render("show.json", %{session: session}) do
    %{data: render_one(session, Insight.SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{token: session.token,
      user_id: session.user_id}
  end

  def render("error.json", _anything) do
    %{errors: "failed to authenticate"}
  end

end
