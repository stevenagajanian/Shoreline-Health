class AlbumsController < ApplicationController

	before_filter :authenticate_user!, only: [:create, :new, :update, :edit, :destroy]
	before_filter :find_user
	before_filter :find_album, only: [:edit, :update, :destroy]

	before_filter :ensure_proper_user, only: [:edit, :new, :create, :update, :destroy]


	def show
		redirect_to album_pictures_path(params[:id])
	end

	def index
		@albums = @user.albums.all
	end

	def new
		@album = current_user.albums.new
	end

	def create
		@album = current_user.albums.new( album_params)

		respond_to do |format|
			if @album.save
				format.html { redirect_to @album, notice: 'Album was successfully created.' }
				format.json { render json: @album, status: :created, location: @album }
			else
				format.html { render action: "new" }
				format.json { render json: @album.errors, status: :unprocessable_entity }
			end
		end
	end

	private

	def album_params
		params.require(:album).permit(:user_id, :title, pictures_attributes[:user_id])
	end

	def ensure_proper_user
		if current_user != @user
			flash[:error] = "You don't have permission to do that."
			redirect_to albums_path
		end
	end


	def find_user
		@user = User.find_by_profile_name(params[:profile_name])
	end

	def find_albums
		@album = current_user.albums.find(params[:id])
	end
end
