class Condition < ActiveRecord::Base
	belongs_to :user
	has_many :posts
	belongs_to :page
	has_many :medications
	#has_many :sages, 
	#validates :page_id, presence: true

	def self.search(search)
  		where('name LIKE?', "%#{search}%")
  	end
end
