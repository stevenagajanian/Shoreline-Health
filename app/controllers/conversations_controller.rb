class ConversationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @conversations = current_user.conversations
  end

  def show
    @conversation = Conversation.find(params[:id])
    @user = @conversation.user

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conversation }
    end
  end

  def update
    @conversation = Conversation.find(params[:id])
    @conversation.update(conversation_params)

    respond_to do |format|
      format.html { redirect_to user_summary_path(current_user), notice: 'Successfully updated!' }
      format.json { head :no_content }
    end
  end

  def new
    @user = User.find(params[:user_id])
    @conversation = @user.conversations.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @conversation }
    end
  end
  
  def edit
    @conversation = Conversation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @conversation }
    end
  end
  
  def destroy
    @conversation = Conversation.find(params[:id])
    @user = @conversation.user
    @conversation.destroy
    redirect_to user_summary_path(@conversation.user), :notice => "Successfully destroyed conversation."
  end

  def create
    @conversation = current_user.conversations.new( conversation_params)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to user_summary_path(@conversation.user), notice: 'Conversation was successfully created.' }
        format.json { render json: @conversation, status: :created, location: @conversation }
      else
        format.html { render action: "new" }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:user_id, :other_id)
  end
end
