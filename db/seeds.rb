require_relative("../models/artist.rb")
require_relative("../models/exhibition.rb")
require_relative("../models/category.rb")

artist1 = Artist.new({
  "name" => "Pablo Picasso",
  "year_of_birth" => 1881,
  "year_of_death" => 1973,
  "biography" => "Pablo Ruiz Picasso (25 October 1881 – 8 April 1973) was a Spanish painter,
  sculptor, printmaker, ceramicist, stage designer, poet and playwright who spent most of his adult life in France.
  Regarded as one of the most influential artists of the 20th century, he is known for co-founding the Cubist movement,
  the invention of constructed sculpture,the co-invention of collage,
  and for the wide variety of styles that he helped develop and explore.
  Among his most famous works are the proto-Cubist Les Demoiselles d'Avignon (1907),
  and Guernica (1937), a dramatic portrayal of the bombing of Guernica by the German and
  Italian airforces during the Spanish Civil War."
  })

artist1.save

artist2 = Artist.new({
  "name" => "Vincent Van Gogh",
  "year_of_birth" => 1853,
  "year_of_death" => 1890,
  "biography" => "Vincent Willem van Gogh (30 March 1853 – 29 July 1890)
  was a Dutch post-impressionist painter who is among the most famous and influential figures in the history of
  Western art. In just over a decade he created about 2,100 artworks, including around 860 oil paintings,
  most of them in the last two years of his life. They include landscapes, still lifes, portraits and self-portraits,
  and are characterised by bold colours and dramatic, impulsive and expressive brushwork that
  contributed to the foundations of modern art. However, he was not commercially successful,
  and his suicide at 37 followed years of mental illness and poverty."
  })

artist2.save

artist3 = Artist.new({
  "name" => "Andy Warhol",
  "year_of_birth" => 1928,
  "year_of_death" => 1987,
  "biography" => "Andy Warhol (born Andrew Warhola; August 6, 1928 – February 22, 1987) was an American artist,
  director and producer who was a leading figure in the visual art movement known as pop art.
  His works explore the relationship between artistic expression, celebrity culture, and advertising
  that flourished by the 1960s, and span a variety of media, including painting, silkscreening, photography,
  film, and sculpture. Some of his best known works include the silkscreen paintings Campbell's Soup Cans (1962)
  and Marilyn Diptych (1962), the experimental film Chelsea Girls (1966),
  and the multimedia events known as the Exploding Plastic Inevitable (1966–67)."
  })

artist3.save

category1 = Category.new({
  "type" => "Audiovisual"
  })

category1.save

category2 = Category.new({
  "type" => "Historical"
  })

category2.save

category3 = Category.new ({
  "type" => "Art Showcase"
  })

category3.save

exhibition1 = Exhibition.new({
  "title" => "Arty Art Gallery Picasso Blue Exhibition",
  "artist_id" => artist1.id,
  "category_id" => category3.id,
  "date_of_exhibition" => "2019-07-12",
  "time_of_exhibition" => "12:00",
  "description" => "An exploration of the work of Pablo Picasso during what is
  known as his Blue Period."
  })

exhibition1.save

exhibition2 = Exhibition.new({
  "title" => "Arty Art Gallery Picasso Rose Exhibition",
  "artist_id" => artist1.id,
  "category_id" => category3.id,
  "date_of_exhibition" => "2019-09-12",
  "time_of_exhibition" => "12:00",
  "description" => "An exploration of the work of Pablo Picasso during what is
  known as his Rose Period."
  })

exhibition2.save

exhibition3 = Exhibition.new({
  "title" => "Arty Art Gallery Van Gogh Artwork Exhibition",
  "artist_id" => artist2.id,
  "category_id" => category3.id,
  "date_of_exhibition" => "2019-10-07",
  "time_of_exhibition" => "14:00",
  "description" => "An exploration of some of the most famous pieces of Vincent Van Gogh."
  })

exhibition3.save

exhibition4 = Exhibition.new({
  "title" => "Arty Art Gallery Van Gogh Life Exhibition",
  "artist_id" => artist2.id,
  "category_id" => category2.id,
  "date_of_exhibition" => "2019-11-08",
  "time_of_exhibition" => "12:00",
  "description" => "A historical journey exploring the life of Vincent Van Gogh."
  })

exhibition4.save

exhibition5 = Exhibition.new({
  "title" => "Arty Art Gallery Warhol Exhibition",
  "artist_id" => artist3.id,
  "category_id" => category3.id,
  "date_of_exhibition" => "2020-01-10",
  "time_of_exhibition" => "13:00",
  "description" => "An exploration of the work of Andy Warhol."
  })

exhibition5.save

exhibition6 = Exhibition.new({
  "title" => "Arty Art Gallery Warhol Film Viewing",
  "artist_id" => artist3.id,
  "category_id" => category1.id,
  "date_of_exhibition" => "2020-02-12",
  "time_of_exhibition" => "18:00",
  "description" => "An evening viewing of the most famous films of Andy Warhol."
  })

exhibition6.save
