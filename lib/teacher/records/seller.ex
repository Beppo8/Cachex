defmodule Teacher.Records.Seller do
  use Ecto.Schema
  import Ecto.Changeset
  alias Teacher.Records.{Album, Seller}


  schema "sellers" do
    field :email, :string
    field :phone_number, :string
    has_many :albums, Album

    timestamps()
  end

  @doc false
  def changeset(%Seller{} = seller, attrs) do
    seller
    |> cast(attrs, [:email, :phone_number])
    |> validate_required([:email, :phone_number])
  end
end
