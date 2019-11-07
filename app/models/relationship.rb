class Relationship < ApplicationRecord
  belongs_to :tagable, polymorphic: true
  belongs_to :tag
  validates :tag, uniqueness: { scope: :tagable_id, message: "You can only book one spot per event" }
end
