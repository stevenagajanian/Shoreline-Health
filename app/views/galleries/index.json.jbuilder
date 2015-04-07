json.array!(@galleries) do |gallery|
  json.extract! gallery, :id, :user_id, :name, :description, :doctor_visit_id, :post_id, :symptom_id, :lab_result
  json.url gallery_url(gallery, format: :json)
end
