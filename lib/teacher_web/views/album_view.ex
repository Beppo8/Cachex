defmodule TeacherWeb.AlbumView do
  use TeacherWeb, :view

  alias Teacher.Records

  def category_name(category_id) do
    with {_, name} = Cachex.fetch(:category_cache, category_id, &set_category_name/1) do
      Cachex.expire(:category_cache, category_id, :timer.seconds(5))
      name
    end
  end

  defp set_category_name(category_id) do
    category = Records.get_category(category_id)
    {:commit, category.name}
  end

end
