class Event < ApplicationRecord
  belongs_to :user
  belongs_to :hub
  has_many :event_bookings
  has_many :users, through: :event_bookings
  has_many :event_types
  has_many :types, through: :event_types
  has_many :tags, as: :tagable
  validates :title, :description, :start_time, :end_time, :address, :capacity, presence: true

  mount_uploader :photo, PhotoUploader
  validates :start_time, :end_time, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "must be after the start date")
    end
  end
end
