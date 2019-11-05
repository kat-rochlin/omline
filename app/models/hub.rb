class Hub < ApplicationRecord
  has_many :tags, as: :tagable
  validates :city, presence: true
end
