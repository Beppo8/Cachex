defmodule TeacherWeb.AlbumView do
  use TeacherWeb, :view

  def category_name(category_id) do
    {:ok, name} = Cachex.get(:category_cache, category_id)
    name
  end

end
