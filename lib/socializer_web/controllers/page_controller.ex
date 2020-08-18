defmodule SocializerWeb.PageController do
  use SocializerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
