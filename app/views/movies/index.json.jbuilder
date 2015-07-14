json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :rating, :image_url, :length_in_minutes, :genre, :description, :actors
  json.url movie_url(movie, format: :json)
end
