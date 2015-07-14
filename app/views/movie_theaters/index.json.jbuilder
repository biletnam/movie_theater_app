json.array!(@movie_theaters) do |movie_theater|
  json.extract! movie_theater, :id, :name, :address_1, :address_2, :city, :state, :zip, :phone
  json.url movie_theater_url(movie_theater, format: :json)
end
