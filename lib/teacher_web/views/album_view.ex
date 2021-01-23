defmodule TeacherWeb.AlbumView do
  use TeacherWeb, :view

  alias Teacher.Records

  def category_name(category_id) do
    {_, name} = Cachex.fetch(:category_cache, category_id, fn(key) ->
      category = Records.get_category(key)
      {:commit, category.name}
    end)
    name
  end

end
