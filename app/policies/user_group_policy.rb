class UserGroupPolicy < ApplicationPolicy
  def new?
    return true
  end

  def create? 
    return true
  end

  def accept?
    record.user == user
  end

  def decline?
    record.user == user
  end

  def giveup?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
