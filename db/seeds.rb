# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

def range(min, max)
  (rand*(max-min) + min).round(1)
end

100.times do |index|
  principal_char = Faker::Name.first_name
  hero = Faker::Superhero.name
  verb = Faker::Verb
  country = Faker::Address.country
  name = "#{principal_char} #{verb.ing_form} with #{hero} in #{country}"
  year = rand(1900..2000)
  genre = ["action", "horreur", "comédie", "drame"].sample
  synopsis = "#{principal_char} was in #{country} when suddenly he met #{hero}. The world was in danger, therefore they decided to #{verb.base} in order to save it. Chuck Norris was also here #{Faker::ChuckNorris.fact}"
  director = Faker::FunnyName.two_word_name
  allocine_rating = range(0, 5)
  Movie.create(name: name, year: year, genre: genre, synopsis: synopsis, director: director, allocine_rating: allocine_rating, my_rating: nil, already_seen: false)
end
