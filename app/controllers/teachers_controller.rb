class TeachersController < ApplicationController
  def new_profile
  end

  def save_profile
    params.require(:teacher).permit(:certifications).each do |id|
      TeacherCertification.create(certification_id: id, user: current_user)
    end

    params.require(:teacher).permit(:styles).each do |id|
      TeacherTeachingStyle.create(teaching_style_id: id, user: current_user)
    end

    params.require(:teacher).permit(:languages).each do |id|
      TeacherLanguage.create(language_id: id, user: current_user)
    end

    params.require(:experience).permit(:studio_name, :location, :description, :start_date, :end_date).each do
      Experience.create(studio: studio_name, location: location, description: description, start: start_date, end: end_date)
    end

    redirect_to hubs_path
  end
end
