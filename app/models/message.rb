class Message < ApplicationRecord
  belongs_to :user_connection
  belongs_to :user

  validates_presence_of :content, :user_connection_id, :user_id

  def message_time
    created_at.strftime("%l:%M %p")
  end

  def message_day
    created_at.strftime("%d.%m.%y")
  end

  def conversations
    @conversations = Conversation.all
    @user = User.all
  end
end
