defmodule Teacher.CategoryWarmer do
  use Cachex.Warmer

  alias Teacher.Records

  def interval, do: :time.minutes(1)

  def execute(_args) do
    categories = Records.list_categories()
    formatted_categories =
      Enum.map(categories, fn category ->
        {category.id, category.name}
      end)

    {:ok, formatted_categories}
  end
end
