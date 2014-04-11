class ProfilesController < ApplicationController
  def show
  	 @user = User.find_by_profile_name(params[:id])
  	 if @user
  	 	render action: :show
  	 end
  end
end
