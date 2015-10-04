json.array!(@links) do |link|
  json.extract! link, :id, :url, :user_id, :num_votes
  json.url link_url(link, format: :json)
end
