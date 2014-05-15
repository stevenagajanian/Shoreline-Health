class StaticPagesController < ApplicationController
  def home
  	if user_signed_in?
  		redirect_to current_user
  	end
  end

  def search
  	@user = current_user
  	@goals = @user.goals.search(params[:search])
  	@conditions = @user.conditions.search(params[:search])
  	@medications = @user.medications.search(params[:search])
  end

  def help
  end

  def about
  end

  def community_stats
  end
end
