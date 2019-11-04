class Studio < ApplicationRecord
  belongs_to :hub
  has_many :tags, as: :tagable
end
