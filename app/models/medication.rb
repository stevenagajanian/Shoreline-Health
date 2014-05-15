class Medication < ActiveRecord::Base
	belongs_to :user

	def self.search(search)
  		where('name LIKE?', "%#{search}%")
  	end
end
