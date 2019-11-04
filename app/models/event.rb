class Event < ApplicationRecord
  belongs_to :user
  belongs_to :hub
  has_many :tags, as: :tagable
end
