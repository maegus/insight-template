defmodule Insight.AuthorizationController do
  use Insight.Web, :controller
  import Plug.Conn

  def handle_unauthorized(conn) do
    conn
    |> put_status(:unauthorized)
    |> render(Insight.ErrorView, "error.json", %{error: "failed to authorized"})
  end

end
