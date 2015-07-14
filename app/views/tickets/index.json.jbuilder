json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :type, :price, :showing_id
  json.url ticket_url(ticket, format: :json)
end
