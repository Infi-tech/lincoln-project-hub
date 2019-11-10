defmodule LincolnProjectHubWeb.AdminController do
  use LincolnProjectHubWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", layout: {LincolnProjectHubWeb.LayoutView, "admin.html"})
  end
end
