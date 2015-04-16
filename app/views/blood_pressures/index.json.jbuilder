json.array!(@blood_pressures) do |blood_pressure|
  json.extract! blood_pressure, :id, :user_id, :author_id, :systolic, :diastolic, :location
  json.url blood_pressure_url(blood_pressure, format: :json)
end
