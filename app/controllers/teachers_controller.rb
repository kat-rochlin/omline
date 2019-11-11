class TeachersController < ApplicationController
  def new_profile
  end

  def save_profile
    params[:teacher][:certifications].filter { |cert| cert != '' }.each do |id|
      TeacherCertification.create(certification_id: id, user: current_user)
    end

    params[:teacher][:styles].filter { |cert| cert != '' }.each do |id|
      TeacherTeachingStyle.create(teaching_style_id: id, user: current_user)
    end

    params[:teacher][:languages].filter { |cert| cert != '' }.each do |id|
      TeacherLanguage.create(language_id: id, user: current_user)
    end

    params[:experience].each do |experience|
      experience[1].each do |exp|
        TeacherExperience.create!(studio_name: exp[1], location: exp[1], description: exp[1], start_date: exp[1], end_date: exp[1], user: current_user)
      end
    end

    redirect_to hubs_path
  end
end
