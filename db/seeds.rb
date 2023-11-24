require 'json'
require 'open-uri'

puts 'Cleaning database...'
Movie.destroy_all
puts 'Creating movies...'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_string = URI.open(url).read
movies = JSON.parse(movies_string)

movies['results'].each do |movie|
  movie = Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie['poster_path'],
    rating: movie['vote_average']
  )
  puts "Created #{movie.title}"
end
puts 'Finished!'

boo
