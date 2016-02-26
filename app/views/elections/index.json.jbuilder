json.array!(@elections) do |election|
  json.extract! election, :id, :name, :code
  json.url election_url(election, format: :json)
end
