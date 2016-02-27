json.array!(@vote_methods) do |vote_method|
  json.extract! vote_method, :id, :name, :code
  json.url vote_method_url(vote_method, format: :json)
end
