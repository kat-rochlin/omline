class Message < ApplicationRecord
  belongs_to :user_connection
  belongs_to :user

  validates_presence_of :content, :user_connection_id, :user_id
end
