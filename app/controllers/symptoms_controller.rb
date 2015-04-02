class SymptomsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @symptom = current_user.symptoms.new
    @symptoms = @user.symptoms
  end

  def show
    @symptom = Symptom.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @symptom }
    end
  end
  
  def update
    @symptom = Symptom.find(params[:id])
    @symptom.update(symptom_params)

    respond_to do |format|
      format.html { redirect_to user_dashboard_path(current_user), notice: 'Successfully updated!' }
      format.json { head :no_content }
    end
  end

  def edit
    @symptom = Symptom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @symptom }
    end
  end

  def new
    @user = User.find(params[:user_id])
    @symptom = @user.symptoms.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @symptom }
    end
  end

  def destroy
    @symptom = Symptom.find(params[:id])
    @user = @symptom.user
    @symptom.destroy
    redirect_to user_dashboard_path(@symptom.user), flash: { info: "Successfully destroyed symptom."}
  end

  def create
    @symptom = current_user.symptoms.new( symptom_params)

    respond_to do |format|
      if @symptom.save
        format.html { redirect_to user_dashboard_path(@symptom.user), notice: 'symptom was successfully created.' }
        format.json { render json: @symptom, status: :created, location: @symptom }
      else
        format.html { render action: "new" }
        format.json { render json: @symptom.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def symptom_params
    params.require(:symptom).permit(:user_id, :description, :date_occured)
  end
end
