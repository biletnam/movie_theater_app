json.array!(@ticket_offerings) do |ticket_offering|
  json.extract! ticket_offering, :id, :name, :price, :movie_theater_id
  json.url ticket_offering_url(ticket_offering, format: :json)
end
