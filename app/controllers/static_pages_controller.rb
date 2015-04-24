class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to current_user
      @user = current_user
    end
  end

  def ecard
    @user = current_user
  end

  def features
    if user_signed_in?
      @user = current_user
    end
  end

  def search
    @user = current_user
    @goals = @user.goals.search(params[:search])
    @conditions = @user.conditions.search(params[:search])
    @medications = @user.medications.search(params[:search])
    @pages = Page.where(['name ILIKE ?', "%#{params[:search]}%"]).paginate(:page => params[:page], :per_page => 25).order('name ASC')
  @users = User.where(["email ILIKE ? OR last_name ILIKE ? OR first_name ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%"]).paginate(:page => params[:page], :per_page => 3).order('name ASC')
end

def help
  @user = current_user
end

def about
  @user = current_user
end

def community_stats
  @user = current_user
end

def roadmap
  @user = current_user
end
end
