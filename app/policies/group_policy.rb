class GroupPolicy < ApplicationPolicy
  def show?
    record.users.include?(user) or user.admin?
  end

  def index?
    return true
  end

  def new?
    return true
  end

  def completed?
    return true
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
