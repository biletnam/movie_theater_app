json.array!(@showings) do |showing|
  json.extract! showing, :id, :time_slot, :seats_available, :screening_room_id, :movie_id
  json.url showing_url(showing, format: :json)
end
