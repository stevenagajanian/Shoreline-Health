class NotificationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @notification = current_user.notifications.new
    @notifications = @user.notifications.order('created_at DESC')
  end

  def show
    @notification = Notification.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notification }
    end
  end

  def edit
    @notification = Notification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @notification }
    end
  end

  def new
    @notification = current_user.notifications.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @notification }
    end
  end

  def destroy
    @notification = Notification.find(params[:id])
    @user = @notification.user
    @notification.destroy
    redirect_to user_notifications_path(@notification.user), flash: { info: "Successfully destroyed notification."}
  end

  def create
    @notification = current_user.notifications.new( notification_params)

    respond_to do |format|
      if @notification.save
        format.html { redirect_to user_notifications_path(@notification.user), notice: 'notification was successfully created.' }
        format.json { render json: @notification, status: :created, location: @notification }
      else
        format.html { render action: "new" }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:user_id, :b_read, :content, :imageurl, :notificationurl)
  end
end
