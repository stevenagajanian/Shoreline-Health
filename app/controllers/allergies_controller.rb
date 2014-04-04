class AllergiesController < ApplicationController
  def index
  end

  def show
  end

  def new
  	@allergy = Allergy.new
  end

  def destroy
  	@allergy = Allergy.find(params[:id])
  	@user = @allergy.user
    @allergy.destroy
    redirect_to user_path(@user), :notice => "Successfully destroyed allergy."
  end

  def create
    @allergy = Allergy.new(allergy_params)
    if @allergy.save
      redirect_to @allergy.user, :notice => "Successfully created allergy."
    else
      render :action => 'new'
    end
  end

  private

  def allergy_params
  	params.require(:allergy).permit(:user_id, :name, :description)
  end
end
