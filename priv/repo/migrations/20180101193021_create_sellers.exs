defmodule Teacher.Repo.Migrations.CreateSellers do
  use Ecto.Migration

  def change do
    create table(:sellers) do
      add :email, :string
      add :phone_number, :string

      timestamps()
    end

  end
end
