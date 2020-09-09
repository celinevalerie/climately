class ChallengesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def show
    set_user
  end

  def index
    @navbartitle = "Challenges"
    if params.has_key?(:category)
      @challenges = policy_scope(Challenge).where(category: params[:category])
      @category = params[:category]
    else
      @challenges = policy_scope(Challenge)
      @category = 'All'
    end
    respond_to do |format|
      format.html
      format.json { render json: { challenges: @challenges } }
    end
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
