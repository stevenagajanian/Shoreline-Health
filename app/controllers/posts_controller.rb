class PostsController < ApplicationController
  before_filter :find_episode
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @episode = Episode.find(params[:episode_id])
    @posts = @episode.posts.all
  end

  def show
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @post }
      end
  end

  # GET /posts/new
  def new
    @episode = Episode.find(params[:episode_id])
    @post = @episode.posts.new
  end

  # POST /posts
  # POST /posts.json
  def create
      @post = @episode.posts.new( post_params)
      
      respond_to do |format|
        if @post.save
          format.html { redirect_to episode_posts_path(@episode), notice: 'Post was successfully created.' }
          format.json { render json: @post, status: :created, location: @post }
        else
          format.html { render action: "new" }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
  end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
   
  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :description)
  end

  def find_episode
    @episode = Episode.find(params[:episode_id])
    #@user = User.find(@album.user_id)
    #@album = @user.albums.find(params[:album_id])
  end

  def find_post
    @post = @episode.posts.find(params[:id])
  end
end
