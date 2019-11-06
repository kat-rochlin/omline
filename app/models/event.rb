class Event < ApplicationRecord
  belongs_to :user
  belongs_to :hub
  has_many :event_bookings
  has_many :users, through: :event_bookings
  has_many :event_types
  has_many :types, through: :event_types
  has_many :tags, as: :tagable
  validates :title, :description, :start_time, :end_time, :address, :capacity, presence: true
end
