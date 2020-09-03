class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    set_user
  end

  def index
    @challenges = policy_scope(Challenge)
  end

  private

  def set_user
    @challenge = Challenge.find(params[:id])
    authorize @challenge
  end

  def user_params
    params.require(:challenge).permit(:name, :description)
  end
end
