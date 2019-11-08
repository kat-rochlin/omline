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
    @tags = Tag.all
    @events = Event.where(user: current_user)
  end

  def current_hub
    @user = current_user
    newhub = Hub.find(params[:newhub].to_i)
    @user.update(hub: newhub)
    redirect_to dashboard_path
  end

  def add_tag
    @user = current_user
    newtag = Tag.where(tag_name: params[:tag], tag_type: "user")
    relation = Relationship.new(tag_id: newtag.first.id, tagable: @user)
    relation.save
    redirect_to dashboard_path
  end

  def remove_tag
    @user = current_user
    tag = @user.tags.where(tag_name: params[:tag]).first
    relationship = Relationship.where(tag_id: tag.id, tagable_id: @user.id).first
    relationship.destroy
    redirect_to dashboard_path
  end

  def request_friend
    current_user.friend_request(@user)
    flash[:notice] = "Friendship Requested"
    redirect_to profile_path(@user)
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

