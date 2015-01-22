json.array!(@droplets) do |droplet|
  json.extract! droplet, :id, :user_id, :page_id, :body_html, :body, :upvotes, :downvotes
  json.url droplet_url(droplet, format: :json)
end
