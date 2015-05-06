class Photo < ActiveRecord::Base
  belongs_to :doctor_visit
  belongs_to :symptom
  belongs_to :allergy
  belongs_to :immunization
  belongs_to :medication

  # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :image, styles: { thumb: '100x100>', square: '200x200#' }, storage: :s3, bucket: ENV['S3_BUCKET_NAME'], s3_credentials: { access_key_id: ENV['AWS_ACCESS_KEY_ID'], secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'] }, url: ":s3_domain_url", :path => "/images/:id/:style.:extension"

  #has_attached_file :image,:path => ":rails_root/public/photos/:id/:filename", :url  => "/images/:id/:filename"

end
