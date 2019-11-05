class Hub < ApplicationRecord
  has_many :tags, as: :tagable
end
