class UsersController < ApplicationController
  def create
  end

  def complete_profile
    @user = current_user
  end

  def update_profile
    if params[:save] == "save"
      @user = current_user
      params[:user][:tag_ids].shift
      params[:user][:tag_ids].each do |tagid|
        newtag = Tag.where(id: tagid)
        relation = Relationship.new(tag_id: newtag.first.id, tagable: @user)
        relation.save
      end
      redirect_to dashboard_path
    else
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
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :birthdate, :nationality, :is_teacher, :profile_photo, :cover_photo)
  end
end
