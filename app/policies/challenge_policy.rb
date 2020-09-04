class ChallengePolicy < ApplicationPolicy
  def show? 
    return true
  end

  def index? 
    return true
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
