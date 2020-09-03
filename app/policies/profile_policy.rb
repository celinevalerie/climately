class ProfilePolicy < ApplicationPolicy
  
  def show? 
    return true
  end

  def edit?
    record == user or user.admin?
  end
  
  def update? 
    record == user or user.admin?
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
