# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Teacher.Repo.insert!(%Teacher.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Teacher.Repo
alias Teacher.Records.Seller

seller = Repo.insert!(%Seller {
  email: "albums4sale@example.com",
  phone_number: "5558675309"
})

attrs_1 = %{
  title: "Blonde on Blonde",
  artist: "Bob Dylan",
  summary: "Blonde on Blonde is the seventh studio album by American singer-songwriter Bob Dylan, released in mid 1966, on Columbia Records. Recording sessions began in New York in October 1965 with numerous backing musicians, including members of Dylan's live backing band, the Hawks.",
  year: "1966",
  popularity: 99.4,
  price: 1200
}

album_1_changeset = Ecto.build_assoc(seller, :albums, attrs_1)
Repo.insert(album_1_changeset)

attrs_2 = %{
  title: "The Wild, The Innocent & The E Street Shuffle",
  artist: "Bruce Springsteen",
  summary: "The Wild, the Innocent & the E Street Shuffle is the second studio album by American rock singer-songwriter Bruce Springsteen. It was recorded by Springsteen with the E Street Band at 914 Sound Studios in Blauvelt, New York; and released on September 11, 1973, by Columbia Records.",
  year: "1973",
  popularity: 97.4,
  price: 900,
}

album_2_changeset = Ecto.build_assoc(seller, :albums, attrs_2)
Repo.insert(album_2_changeset)

attrs_3 = %{
  title: "Abbey Road",
  artist: "The Beatles",
  summary: "Abbey Road is the eleventh album by English rock band the Beatles, released on 26 September 1969 by Apple Records. The recording sessions for the album were the last in which all four Beatles participated. Although Let It Be was the final album that the Beatles completed before the band's dissolution in April 1970",
  year: "1969",
  popularity: 99.9,
  price: 1100
}

album_3_changeset = Ecto.build_assoc(seller, :albums, attrs_3)
Repo.insert(album_3_changeset)

attrs_4 = %{
  title: "Untitled",
  artist: "Led Zeppelin",
  summary: "English rock band Led Zeppelin's untitled fourth album, commonly known as Led Zeppelin IV, was released on 8 November 1971 by Atlantic Records. Produced by guitarist Jimmy Page, it was recorded between November 1970 and January 1971 at several locations, most prominently the Victorian house Headley Grange.",
  year: "1971",
  popularity: 98.4,
  price: 1100
}

album_4_changeset = Ecto.build_assoc(seller, :albums, attrs_4)
Repo.insert(album_4_changeset)

attrs_5 = %{
  title: "Highway 61 Revisited",
  artist: "Bob Dylan",
  summary: "Highway 61 Revisited is the sixth studio album by the American singer-songwriter Bob Dylan. It was released on August 30, 1965, by Columbia Records. Having until then recorded mostly acoustic music, Dylan used rock musicians as his backing band on every track of the album, except for the closing 11-minute ballad, 'Desolation Row'.",
  year: "1965",
  popularity: 99.9,
  price: 1200
}

album_5_changeset = Ecto.build_assoc(seller, :albums, attrs_5)
Repo.insert(album_5_changeset)

attrs_6 = %{
  title: "Kind Of Blue",
  artist: "Miles Davis",
  summary: "Kind of Blue is a studio album by American jazz trumpeter Miles Davis. It is regarded by many critics as jazz's greatest record, Davis's masterpiece, and one of the best albums of all time. Its influence on music, including jazz, rock, and classical genres, has led writers to also deem it one of the most influential albums ever recorded.",
  year: "1959",
  popularity: 98.5,
  price: 1000
}

album_6_changeset = Ecto.build_assoc(seller, :albums, attrs_6)
Repo.insert(album_6_changeset)
