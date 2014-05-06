class ConditionsController < ApplicationController
before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @conditions = @user.conditions
  end

  def show
    @condition = Condition.find(params[:id])

    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @condition }
   end
  end

  def new
  	@condition = current_user.conditions.new

    respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @condition }
    end
  end

  def destroy
  	@condition = Condition.find(params[:id])
  	@user = @condition.user
    @condition.destroy
    redirect_to user_conditions_path(@condition.user), :notice => "Successfully destroyed condition."
  end

  def create
   @condition = current_user.conditions.new( condition_params)

    respond_to do |format|
      if @condition.save
        format.html { redirect_to user_conditions_path(@condition.user), notice: 'Status was successfully created.' }
        format.json { render json: @condition, status: :created, location: @condition }
      else
        format.html { render action: "new" }
        format.json { render json: @condition.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def condition_params
  	params.require(:condition).permit(:name, :description)
  end
end
