json.array!(@pharmacies) do |pharmacy|
  json.extract! pharmacy, :id, :user_id, :medication_id, :name, :b_current
  json.url pharmacy_url(pharmacy, format: :json)
end
