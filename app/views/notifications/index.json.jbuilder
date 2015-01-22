json.array!(@notifications) do |notification|
  json.extract! notification, :id, :user_id, :b_read, :content, :imageurl, :notificationurl
  json.url notification_url(notification, format: :json)
end
