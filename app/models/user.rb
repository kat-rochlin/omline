class User < ApplicationRecord
  belongs_to :hub, optional: true
  has_many :tags, as: :tagable
  has_many :event_bookings
  has_many :events, through: :event_bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
