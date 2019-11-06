class PagesController < ApplicationController
  before_action :set_user, only: [:profile, :accept_friend, :request_friend, :remove_friend]

  def home
  end

  def profile
    @sender = current_user
    @recipient = @user
    if UserConnection.between(@sender, @recipient).present?
      @connection = UserConnection.between(@sender, @recipient).first
    end
  end

  def dashboard
    @user = current_user
  end

  def current_hub
    @user = current_user
    newhub = Hub.find(params[:newhub].to_i)
    @user.update(hub: newhub)
    redirect_to dashboard_path
  end

  def request_friend
    current_user.friend_request(@user)
    # raise
    flash[:notice] = "Friendship Requested"
  end

  def accept_friend
    current_user.accept_request(@user)
    redirect_to dashboard_path
  end

  def remove_friend
    current_user.remove_friend(@user)
    redirect_to dashboard_path
  end

  def set_user
    @user = User.find(params[:id])
  end
end

# # @mac sends a friend request to @dee
# @current_user.friend_request()

# # @dee can accept the friend request
# @dee.accept_request(@mac)

# # @dee can also decline the friend request
# @dee.decline_request(@mac)
