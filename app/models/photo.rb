class Photo < ActiveRecord::Base
  belongs_to :doctor_visit
  belongs_to :symptom
  belongs_to :allergy
  belongs_to :immunization
  belongs_to :medication

  has_attached_file :image,:path => ":rails_root/public/photos/:id/:filename", :url  => "/images/:id/:filename"

 # do_not_validate_attachment_file_type  :image
end
