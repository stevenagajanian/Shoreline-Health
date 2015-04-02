json.array!(@symptoms) do |symptom|
  json.extract! symptom, :id, :user_id, :description, :date_occured
  json.url symptom_url(symptom, format: :json)
end
