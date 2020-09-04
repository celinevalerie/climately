class MessagePolicy < ApplicationPolicy
  def create? 
    @group = record.chatroom.group
    @group.users.include?(user) or user.admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
