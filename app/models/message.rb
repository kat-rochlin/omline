class Message < ApplicationRecord
  belongs_to :user_connection
  belongs_to :user

  validates_presence_of :content, :user_connection_id, :user_id

  def message_time
    created_at.strftime("%m/%d/%y at %l:%M %p")
  end

  def conversations
    raise
    @conversations = Conversation.all
    @user = User.all
  end
end
