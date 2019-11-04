class TeacherCertification < ApplicationRecord
  belongs_to :user
  belongs_to :certification
end
