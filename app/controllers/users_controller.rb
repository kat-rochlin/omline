class UsersController < ApplicationController
  def create
  end

  def complete_profile
    @user = current_user
  end

  def update_profile
    @user = current_user

    if @user.update(user_params)
      if @user.is_teacher
        redirect_to new_teacher_profile_path
      else
        redirect_to hubs_path({ :newhub => "newhub" })

      end
    else
      render 'complete_profile'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthdate, :nationality, :is_teacher, :profile_photo, :cover_photo)
  end
end
