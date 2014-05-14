class UsersController < ApplicationController
	before_filter :authenticate_user!
	before_filter :add_breadcrumbs, only: [:show]

	def update

	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
	end

	def index
		@users = User.all
	end

	def apps
		@user = User.find(params[:user_id])
	end

	def show
		@user = User.find(params[:id])
	end

	def ecard
		@user = User.find(params[:user_id])
	end

	private

	def find_user
    		@user = User.find(params[:id])
  	end

	def add_breadcrumbs

			@user = User.find(params[:id])
			add_breadcrumb @user.first_name, user_path(@user)
			add_breadcrumb "Albums", albums_path
	
	end

	def user_params
		params.require(:user).permit(:gender, :doner, :bloodtype, :address, :date_of_birth, :email, :profile_name, :first_name, :last_name, :avatar, allergies_attributes: [ :user_id, :name, :description ], pictures_attributes: [ :user_id, :album_id, :caption], albums_attributes: [ :user_id, pictures_attributes: [:user_id, :album_id]], friends_attributes: [ :email ] )
	end

end
