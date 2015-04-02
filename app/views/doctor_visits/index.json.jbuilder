json.array!(@doctor_visits) do |doctor_visit|
  json.extract! doctor_visit, :id, :user_id, :notes, :doctor_id, :location, :reason, :album_id
  json.url doctor_visit_url(doctor_visit, format: :json)
end
