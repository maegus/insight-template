defmodule Insight.SessionControllerTest do
  use Insight.ConnCase

  alias Insight.Session
  alias Insight.User

  @valid_attrs %{email: "fizz@buzz.com", password: "password"}

  setup %{conn: conn} do
    insert_user @valid_attrs
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "creates and renders resource when data is valid" do

  end
end
