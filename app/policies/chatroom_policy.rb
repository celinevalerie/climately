class ChatroomPolicy < ApplicationPolicy

  def show? 
    @group = record.group
    @group.users.include?(user) or user.admin?
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
