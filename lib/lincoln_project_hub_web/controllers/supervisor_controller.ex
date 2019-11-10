defmodule LincolnProjectHubWeb.SupervisorController do
  use LincolnProjectHubWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", layout: {LincolnProjectHubWeb.LayoutView, "ambassador.html"})
  end
end
