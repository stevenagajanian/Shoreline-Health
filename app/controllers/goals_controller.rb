class GoalsController < ApplicationController
	def destroy
  		@goal = Goal.find(params[:id])
  		@user = @goal.user
    		@goal.destroy
    		redirect_to album_goals_path(@goal.album), :notice => "Successfully destroyed goal."
  	end

	def show
		@goal = Goal.find(params[:id])
		@user = @goal.user
		respond_to do |format|
	      format.html # show.html.erb
	      format.json { render json: @goal }
	    end
	end

	def index
		@user = User.find(params[:user_id])
		@goals = @user.goals.all
	end

	def new
		@user = User.find(params[:user_id])
		@goal = @user.goals.new

	end

	def create
		@user = User.find(params[:user_id])
	    @goal = @user.goals.new( goal_params)
	    
	    respond_to do |format|
	      if @goal.save
	        format.html { redirect_to user_goals_path(@user), notice: 'Goal was successfully created.' }
	        format.json { render json: @goal, status: :created, location: @goal }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @goal.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private

	def goal_params
		params.require(:goal).permit(:user_id, :name, :number_name, :use_number, :use_photo, :use_words, :number_goal, :use_goal_date, :goal_date, :text, :category)
	end
end
