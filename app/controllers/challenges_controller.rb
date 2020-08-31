class ChallengesController < ApplicationController
  def show
    set_user
  end

  def index
    @challenges = Challenge.all
  end

  private

  def set_user
    @challenge = Challenge.find(params[:id])
  end

  def user_params
    params.require(:challenge).permit(:name, :description)
  end
end
