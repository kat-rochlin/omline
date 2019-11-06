class User < ApplicationRecord
  # bypass hub_id upon signup
  belongs_to :hub, optional: true
  has_many :event_bookings
  has_many :events, through: :event_bookings
  has_many :tags, as: :tagable
  # allows user to have - accept - and block friends
  has_friendship

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
