class EventBooking < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :user, uniqueness: { scope: :event, message: "You can only book one spot per event" }
end
