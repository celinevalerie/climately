class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  include Pundit

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
   def default_url_options
    if Rails.env.production?
      Rails.application.routes.default_url_options = { host: "www.climately.rocks", protocol: 'https' }
    elsif Rails.env.development?
      Rails.application.routes.default_url_options = { host: 'localhost:3000', protocol: 'http' }
    end
   end
  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :user_name, :photo])
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :phone])
  end
  def resource_name
  :user
  end
 def resource
  @resource ||= User.new
 end
 def resource_class
  User
 end
 def devise_mapping
  @devise_mapping ||= Devise.mappings[:user]
 end   
  
 def default_url_options
  { host: ENV["DOMAIN"] || "localhost:3000" }
 end
  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def user_not_authorized
    session[:return_to] ||= request.referer
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to session.delete(:return_to)
  end
end
