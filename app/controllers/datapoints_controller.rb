class DatapointsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :xml, :js

  def index
    @tracker = Tracker.find(params[:tracker_id])
    @datapoint = @tracker.datapoints.new
    @datapoints = @tracker.datapoints
  end
  
  def show
    @datapoint = Datapoint.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @datapoint }
    end
  end
  
  def update
    @datapoint = Datapoint.find(params[:id])
    @datapoint.update(datapoint_params)

    respond_to do |format|
      format.html { redirect_to user_metrics_path(current_user), notice: 'Successfully updated!' }
      format.json { head :no_content }
    end
  end

  def edit
    @datapoint = Datapoint.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @datapoint }
    end
  end

  def new
    @tracker = Tracker.find(params[:tracker_id])
    @datapoint = @tracker.datapoints.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @datapoint }
    end
  end

  def destroy
    @datapoint = Datapoint.find(params[:id])
    @tracker = @datapoint.tracker
    @datapoint.destroy
    redirect_to user_metrics_path(current_user), flash: { info: "Successfully destroyed datapoint."}
  end

  def create
    
  #  @tracker = Tracker.find(params[:tracker_id])
    @datapoint = Datapoint.new( datapoint_params)
    @user = User.find(@datapoint.user_id)
    respond_to do |format|
      if @datapoint.save
        format.js
        format.html { redirect_to user_metrics_path(current_user), notice: 'Datapoint was successfully added.' }
        format.json { render json: @datapoint, status: :created, location: @datapoint }
      else
        format.js
        format.html { render action: "new" }
        format.json { render json: @datapoint.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def datapoint_params
    params.require(:datapoint).permit(:created_at, :user_id, :tracker_id, :amount, :data_name, :b_bar_chart)
  end
end
