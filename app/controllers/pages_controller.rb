class PagesController < ApplicationController
  before_action :set_user, only: [:profile, :accept_friend, :request_friend, :remove_friend]

  def home
  end

  def profile
    sender = current_user
    recipient = @user
    if UserConnection.between(sender, recipient).present?
      raise
      @connection = UserConnection.between(sender, recipient).first
    else
      @connection = nil
    end
  end

  def request_friend
    current_user.friend_request(@user)
    # raise
    flash[:notice] = "Friendship Requested"
  end

  def accept_friend
    current_user.accept_request(@user)
  end

  def remove_friend
    current_user.remove_friend(@user)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def conversations
    @conversations = Conversation.all
  end
end

# # @mac sends a friend request to @dee
# @current_user.friend_request()

# # @dee can accept the friend request
# @dee.accept_request(@mac)

# # @dee can also decline the friend request
# @dee.decline_request(@mac)
