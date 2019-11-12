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

     exp = params[:experience]

     size = exp["studio_name"].keys.count
     (0..size - 1).to_a.each do |index|
        TeacherExperience.create!(studio_name: exp[:studio_name][index.to_s], location: exp[:location][index.to_s], description: exp[:description][index.to_s], start_date: exp[:start_date][index.to_s], end_date: exp[:end_date][index.to_s], user: current_user)
     end

    redirect_to hubs_path
  end
end
