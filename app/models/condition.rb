class Condition < ActiveRecord::Base
	belongs_to :user
	has_many :posts

	def self.search(search)
  		where('name LIKE?', "%#{search}%")
  	end
end
