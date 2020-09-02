
class ProfilesController < ApplicationController
    def show
      set_user
      @users_groups = UserGroup.where("user_id = #{@user.id}")
    end

    def edit
      set_user
    end

    def update
      set_user

      if @user.update(user_params)
        redirect_to profile_path(@user)
      else
        render :new
      end
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :photo)
    end
end

