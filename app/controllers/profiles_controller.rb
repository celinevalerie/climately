class ProfilesController < ApplicationController
    def show
      set_user
      @users_groups = @user.user_groups
      @group = []
      @users_groups.each do |users_group|
        @group << users_group.group
      end
      @group.select { |group| group.completed == true }
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
      authorize @user, policy_class: UserPolicy
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :user_name, :photo)
    end
end

