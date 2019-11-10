defmodule LincolnProjectHubWeb.SessionController do
  use LincolnProjectHubWeb, :controller

  def new(conn, _params) do
    changeset = Pow.Plug.change_user(conn)

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    conn
    |> Pow.Plug.authenticate_user(user_params)
    |> case do
      {:ok, conn} ->
        conn
        |> IO.inspect()
        |> put_flash(:info, "Welcome back!")
        |> redirect_after_authentication()

      # |> if role == "ambassador" do
      #   redirect(to: Routes.ambassador_path(conn, :index))
      # else
      #   redirect(to: Routes.admin_path(conn, :index))
      # end
      # |> redirect(to: Routes.admin_path(conn, :index))

      {:error, conn} ->
        changeset = Pow.Plug.change_user(conn, conn.params["user"])

        conn
        |> put_flash(:info, "Invalid email or password")
        |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, _params) do
    {:ok, conn} = Pow.Plug.clear_authenticated_user(conn)

    redirect(conn, to: Routes.page_path(conn, :index))
  end

  def redirect_after_authentication(conn) do
    path =
      case conn.assigns.current_user.role do
        "administrator" ->
          Routes.admin_path(conn, :index)

        "ambassador" ->
          Routes.ambassador_path(conn, :index)

        "supervisor" ->
          Routes.supervisor_path(conn, :index)
      end

    redirect(conn, to: path)
  end
end
