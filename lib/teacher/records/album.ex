defmodule Teacher.Records.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias Teacher.Records.{Album, Seller}

  schema "albums" do
    field :artist, :string
    field :summary, :string
    field :title, :string
    field :year, :string
    field :price, :integer
    field :popularity, :float
    belongs_to :seller, Seller

    timestamps()
  end

  @doc false
  def changeset(%Album{} = album, attrs) do
    album
    |> cast(attrs, [:title, :summary, :year, :price, :popularity])
    |> validate_required([:title, :summary, :year, :price, :popularity])
  end
end
