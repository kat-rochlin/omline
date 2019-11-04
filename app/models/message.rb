class Message < ApplicationRecord
  belongs_to :user_connection
  belongs_to :user
end
