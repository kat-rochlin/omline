class TeachersController < ApplicationController
  def new_profile

  end

  def save_profile
    params[:certification].each do |id|
      TeacherCertification.create(certification_id: id, user: current_user)
    end

    params[:styles].each do |id|
      TeacherTeachingStyle.create(teaching_style_id: id, user: current_user)
    end

    params[:languages].each do |id|
      TeacherLanguage.create(language_id: id, user: current_user)
    end

    redirect_to hubs_path
  end
end
