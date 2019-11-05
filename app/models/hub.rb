class Hub < ApplicationRecord
  has_many :tags, as: :tagable
  has_many :events

  validates :city, presence: true
end
