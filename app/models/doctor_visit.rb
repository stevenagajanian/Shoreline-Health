class DoctorVisit < ActiveRecord::Base
  belongs_to :user
  validates :doctor, presence: true
  validates :reason, presence: true
end
