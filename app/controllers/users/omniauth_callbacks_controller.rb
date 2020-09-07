class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    user = User.find_for_facebook_oauth(request.env['omniauth.auth'])
    if user.persisted?
      if user.first_name == 'first name' || user.last_name == 'last name'
        sign_in user, event: :authentication
        redirect_to social_profile_path(user)
      else 
        sign_in_and_redirect user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
      end
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end
      def google_oauth2
     user = User.find_for_google_oauth2(request.env['omniauth.auth'])
     if user.persisted?
      if user.first_name == 'first name' || user.last_name == 'last name'
        sign_in user, event: :authentication
        redirect_to social_profile_path(user)
      else 
       sign_in_and_redirect user, event: :authentication
       set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      end
      else
       session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
       redirect_to new_user_registration_url
     end
  end
end
