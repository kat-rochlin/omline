class MessagesController < ApplicationController
  def index
    # 1. find all UserConnections for current user that contain messages
    # 2. in view, list out messages in order of created_at
    # 3. use simple form to allow users to create new messages in a conversation
    @user_connection = UserConnection.find(params[:user_connection_id])
    @message = Message.new
  end

  def create
    @message = params[:message]
    raise
  end
end
