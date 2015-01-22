class DropletsController < ApplicationController
  respond_to :html, :xml, :json
  before_action :set_droplet, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new]

  def index
    @droplets = Droplet.all
    respond_with(@droplets)
  end

  def show
    respond_with(@droplet)
  end

  def new
    @droplet = Droplet.new
    respond_with(@droplet)
  end

  def edit
  end

  def create
    @droplet = Droplet.new(droplet_params)
    @droplet.save
    #respond_with(@droplet)
    redirect_to @droplet.page
  end

  def update
    @droplet.update(droplet_params)
    #respond_with(@droplet)
    redirect_to @droplet.page
  end

  def destroy
    @droplet.destroy
    #respond_with(@droplet)
    redirect_to @droplet.page
  end

  private
    def set_droplet
      @droplet = Droplet.find(params[:id])
    end

    def droplet_params
      params.require(:droplet).permit(:body, :body_html, :user_id, :upvotes, :downvotes, :page_id)
    end
end
