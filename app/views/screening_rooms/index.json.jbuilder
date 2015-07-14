json.array!(@screening_rooms) do |screening_room|
  json.extract! screening_room, :id, :theater_number, :seat_quantity, :movie_theater_id
  json.url screening_room_url(screening_room, format: :json)
end
