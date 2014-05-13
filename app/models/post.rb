class Post < ActiveRecord::Base
	belongs_to :condition
	belongs_to :user
	#has_attached_file :upload
end
