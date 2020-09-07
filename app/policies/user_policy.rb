class UserPolicy < ApplicationPolicy
  def show? 
    return true
  end

  def edit? 
    record.id == user.id or user.admin?
  end

  def social? 
    record.id == user.id or user.admin?
  end
  
  def update? 
    record.id == user.id or user.admin?
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
