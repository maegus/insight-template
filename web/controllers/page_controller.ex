defmodule Insight.PageController do
  use Insight.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
