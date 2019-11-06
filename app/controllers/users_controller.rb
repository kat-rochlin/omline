class UsersController < ApplicationController


  def complete_profile
    @user = current_user
  end

  def update_profile
   @user = current_user

   if @user.update(user_params)
    if @user.is_teacher
      redirect_to new_teacher_profile_path
    else
      redirect_to hubs_path
    end
   else
    render 'complete_profile'
   end
  end

  private


def user_params
  params.require(:user).permit(:first_name, :last_name, :birthdate, :nationality, :is_teacher)
end

end
