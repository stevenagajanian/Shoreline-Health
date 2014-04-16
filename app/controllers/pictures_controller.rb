class PicturesController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	#before_filter :finds_user
	before_filter :find_album
	before_filter :find_picture, only: [:edit, :update, :show, :destroy]
	before_filter :ensure_proper_user, only: [:edit, :new, :create, :update, :destroy]
	#before_filter :add_breadcrumbs

	def index
		@pictures = @album.pictures.all

	end

	def new
		@picture = @album.pictures.new

	end

	private

	def picture_params
		params.require(:picture).permit(:user_id, :album_id)
	end

	def ensure_proper_user
		if current_user != @user
			flash[:error] = "You don't have permission to do that."
			redirect_to album_pictures_path
		end
	end

	def find_album
		@album = @user.albums.find(params[:album_id])
	end
	
	def find_picture
		@picture = @album.pictures.find(params[:id])
	end
end
