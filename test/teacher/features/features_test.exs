defmodule Teacher.RecordsTest do
  use Teacher.DataCase

  alias Teacher.Records

  describe "albums" do
    alias Teacher.Records.Album

    @valid_attrs %{summary: "some summary", title: "some title", year: 42, popularity: 88, price: 99}
    @update_attrs %{summary: "some updated summary", title: "some updated title", year: 43, popularity: 89, price: 100}
    @invalid_attrs %{summary: nil, title: nil, year: nil}

    def album_fixture(attrs \\ %{}) do
      {:ok, album} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Records.create_album()

      album
    end

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Records.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Records.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      assert {:ok, %Album{} = album} = Records.create_album(@valid_attrs)
      assert album.summary == "some summary"
      assert album.title == "some title"
      assert album.year == 42
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Records.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      assert {:ok, album} = Records.update_album(album, @update_attrs)
      assert %Album{} = album
      assert album.summary == "some updated summary"
      assert album.title == "some updated title"
      assert album.year == 43
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Records.update_album(album, @invalid_attrs)
      assert album == Records.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Records.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Records.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Records.change_album(album)
    end
  end
end
