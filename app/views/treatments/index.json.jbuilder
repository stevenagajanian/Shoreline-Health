json.array!(@treatments) do |treatment|
  json.extract! treatment, :id, :name, :description
  json.url treatment_url(treatment, format: :json)
end
