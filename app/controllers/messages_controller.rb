class MessagesController < ApplicationController
  before_action do
    @user_connection = UserConnection.find(params[:user_connection_id])
  end

  def index
    # 1. find all UserConnections for current user that contain messages
    @connections = UserConnection.where('connector_id = ? OR connectee_id = ?', current_user.id, current_user.id)
    @conversations = @connections.pluck(:connector_id, :connectee_id).map do |pair|
      id = pair.find do |friend|
        friend != current_user.id
      end
      User.find(id)
    end
    raise
    @users = User.all
    @message = Message.new
    # 2. in view, list out messages in order of created_at
    @messages = @user_connection.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:button_previous]
      @over_ten = false
      @messages = @user_connection.messages
    end
    @message = Message.new
  end

  # 3. use simple form to allow users to create new messages in a conversation
  def new
    @message = @user_connection.messages.new
  end

  def create
    @message = @user_connection.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to user_connection_messages_path(@user_connection) }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
