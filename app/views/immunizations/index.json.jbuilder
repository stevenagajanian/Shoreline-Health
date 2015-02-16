json.array!(@immunizations) do |immunization|
  json.extract! immunization, :id, :user_id, :name, :description, :b_validated
  json.url immunization_url(immunization, format: :json)
end
