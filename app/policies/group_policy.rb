class GroupPolicy < ApplicationPolicy
  def show?
    record.users.include?(user) or user.admin?
  end

  def index?
    record.users.include?(user) or user.admin?
  end

  def new?
    return true
  end

  def completed?
    record.users.include?(user) or user.admin?
  end

  def create?
    return true
  end
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
