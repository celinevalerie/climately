class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  skip_after_action :verify_authorized
  
  def home
    @challenges = Challenge.all
  end
end
