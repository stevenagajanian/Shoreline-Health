class UsersController < ApplicationController
	before_filter :authenticate_user!

	def update
		
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:email, :profile_name, :first_name, :last_name, :avatar, allergies_attributes: [ :user_id, :name, :description ], pictures_attributes: [ :user_id, :caption], albums_attributes: [ :user_id] )
	end

end
