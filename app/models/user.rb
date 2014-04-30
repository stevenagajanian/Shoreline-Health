class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	:recoverable, :rememberable, :trackable, :validatable

	has_many :allergies
	accepts_nested_attributes_for :allergies
	has_many :medications
	accepts_nested_attributes_for :medications

	has_many :statuses
	has_many :pictures
	has_many :weights
	has_many :heights
	has_many :albums

	has_many :user_friendships


	has_many :friends, through: :user_friendships,
	conditions: { user_friendships: { state: 'accepted' } }
accepts_nested_attributes_for :friends
	has_many :pending_user_friendships, class_name: 'UserFriendship',
	foreign_key: :user_id,
	conditions: { state: 'pending' }
	has_many :pending_friends, through: :pending_user_friendships, source: :friend

	has_many :requested_user_friendships, class_name: 'UserFriendship',
	foreign_key: :user_id,
	conditions: { state: 'requested' }
	has_many :requested_friends, through: :requested_user_friendships, source: :friend

	has_many :blocked_user_friendships, class_name: 'UserFriendship',
	foreign_key: :user_id,
	conditions: { state: 'blocked' }
	has_many :blocked_friends, through: :blocked_user_friendships, source: :friend

	has_many :accepted_user_friendships, class_name: 'UserFriendship',
	foreign_key: :user_id,
	conditions: { state: 'accepted' }
	has_many :accepted_friends, through: :accepted_user_friendships, source: :friend


	has_attached_file :avatar, styles: {
    large: "800x800>", medium: "300x200>", small: "260x180>", thumb: "80x80#"
  }

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true

	def full_name
		first_name + " " + last_name
	end

	def gravatar_url
		stripped_email = email.strip
		downcased_email = stripped_email.downcase
		hash = Digest::MD5.hexdigest(downcased_email)

		"http://gravatar.com/avatar/#{hash}"
	end

	def has_blocked?(other_user)
		blocked_friends.include?(other_user)
	end
end
