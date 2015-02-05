class Tracker < ActiveRecord::Base
	belongs_to :user
	belongs_to :condition
	belongs_to :medication
  has_many :datapoints
end
