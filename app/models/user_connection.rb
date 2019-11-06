class UserConnection < ApplicationRecord
  belongs_to :connectee, class_name: "User"
  belongs_to :connector, class_name: "User"

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :connector_id, :scope => :connectee_id

  scope :between, -> (connector_id, connectee_id) do
    where("(user_connections.connector_id = ? AND user_connections.connectee_id =?) OR (user_connections.connector_id = ? AND user_connections.connectee_id =?)", connector_id, connectee_id, connectee_id, connector_id)
  end
end
