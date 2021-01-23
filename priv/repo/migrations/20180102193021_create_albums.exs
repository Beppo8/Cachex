defmodule Teacher.Repo.Migrations.CreateAlbums do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :artist, :string
      add :title, :string
      add :summary, :text
      add :year, :string
      add :price, :integer
      add :popularity, :float
      add :seller_id, references(:sellers, on_delete: :delete_all)

      timestamps()
    end
    create index(:albums, [:seller_id])

  end
end
