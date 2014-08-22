class Tracker < ActiveRecord::Base
	belongs_to :user
	belongs_to :condition
	has_one :medication
end
