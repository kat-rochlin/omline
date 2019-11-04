class UserConnection < ApplicationRecord
  belongs_to :connectee, class_name: "User"
  belongs_to :connector, class_name: "User"
end
