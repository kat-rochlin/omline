class User < ApplicationRecord
  # bypass hub_id upon signup
  belongs_to :hub, optional: true
  has_many :event_bookings
  has_many :events, through: :event_bookings
  has_many :tags, as: :tagable
  has_many :teacher_experiences
  has_many :teacher_certifications
  has_many :teacher_languages
  has_many :teacher_teaching_styles
  validates :is_teacher, inclusion: { in: [true, false] }, on: :update
  validates :first_name, :last_name, :birthdate, :nationality, presence: true, on: :update
  has_many :user_connections
  # allows user to have - accept - and block friends
  has_friendship
  mount_uploader :profile_photo, PhotoUploader
  mount_uploader :cover_photo, PhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
