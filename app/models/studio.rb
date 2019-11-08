class Studio < ApplicationRecord
  belongs_to :hub
  has_many :tags, as: :tagable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
