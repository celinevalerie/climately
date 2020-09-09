class ProfilesController < ApplicationController

    def show
      set_user  
      authorize @user
      @user_groups = @user.user_groups
      if params.has_key?(:status)
        @user_groups.to_a
        @user_groups = @user_groups.select {|usergroup| usergroup.status == params[:status] && usergroup.user == @user}
        @status = params[:status]
      else
        @user_groups.to_a
        @user_groups = @user_groups.select {|usergroup| usergroup.status == 'active' && usergroup.user == @user}
        @status = 'active'
      end
    end

    def edit
      set_user
    end

    def social
      set_user
      if @user.first_name == "first name"
        @user.first_name = ''
      end 
      if @user.last_name == "last name"
        @user.last_name = ''
      end 
    end

    def update
      set_user

      if @user.update(user_params)
        redirect_to profile_path(@user)
      else
        render :edit
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

