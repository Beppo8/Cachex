defmodule TeacherWeb.AlbumControllerTest do
  use TeacherWeb.ConnCase

  alias Teacher.Records

  @create_attrs %{genre: "some genre", summary: "some summary", title: "some title", year: 42, popularity: 88}
  @update_attrs %{genre: "some updated genre", summary: "some updated summary", title: "some updated title", year: 43, popularity: 89}
  @invalid_attrs %{genre: nil, summary: nil, title: nil, year: nil}

  def fixture(:album) do
    {:ok, album} = Records.create_album(@create_attrs)
    album
  end

  describe "index" do
    test "lists all albums", %{conn: conn} do
      conn = get conn, album_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Records"
    end
  end

  describe "new album" do
    test "renders form", %{conn: conn} do
      conn = get conn, album_path(conn, :new)
      assert html_response(conn, 200) =~ "New Record"
    end
  end

  describe "create album" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, album_path(conn, :create), album: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == album_path(conn, :show, id)

      conn = get conn, album_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Record"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, album_path(conn, :create), album: @invalid_attrs
      assert html_response(conn, 200) =~ "New Record"
    end
  end

  describe "edit album" do
    setup [:create_album]

    test "renders form for editing chosen album", %{conn: conn, album: album} do
      conn = get conn, album_path(conn, :edit, album)
      assert html_response(conn, 200) =~ "Edit Record"
    end
  end

  describe "update album" do
    setup [:create_album]

    test "redirects when data is valid", %{conn: conn, album: album} do
      conn = put conn, album_path(conn, :update, album), album: @update_attrs
      assert redirected_to(conn) == album_path(conn, :show, album)

      conn = get conn, album_path(conn, :show, album)
      assert html_response(conn, 200) =~ "some updated genre"
    end

    test "renders errors when data is invalid", %{conn: conn, album: album} do
      conn = put conn, album_path(conn, :update, album), album: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Record"
    end
  end

  describe "delete album" do
    setup [:create_album]

    test "deletes chosen album", %{conn: conn, album: album} do
      conn = delete conn, album_path(conn, :delete, album)
      assert redirected_to(conn) == album_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, album_path(conn, :show, album)
      end
    end
  end

  defp create_album(_) do
    album = fixture(:album)
    {:ok, album: album}
  end
end
