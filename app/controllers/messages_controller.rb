class MessagesController < ApplicationController
  def index
    # 1. find all UserConnections for current user that contain messages
    # 2. in view, list out messages in order of created_at
    # 3. use simple form to allow users to create new messages in a conversation
    @user_connection = UserConnection.find(params[:user_connection_id])
    @connections = UserConnection.where('connector_id = ? OR connectee_id = ?', current_user.id, current_user.id)
    @conversations = @connections.pluck(:connector_id, :connectee_id).map do |pair|
      id = pair.find do |friend|
        friend != current_user.id
      end
      User.find(id)
    end
    @users = User.all
    @message = Message.new
  end

  def create
    @message = params[:message][:content]
  end
end
