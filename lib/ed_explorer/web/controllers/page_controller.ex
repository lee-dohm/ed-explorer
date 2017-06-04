defmodule EdExplorer.Web.PageController do
  use EdExplorer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
