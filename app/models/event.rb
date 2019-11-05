class Event < ApplicationRecord
  belongs_to :user
  belongs_to :hub
  has_many :types, through: :event_types
  has_many :tags, as: :tagable
  validates :title, :description, :start_time, :end_time, :end_date, :start_date, :address, :capacity, presence: true
end
