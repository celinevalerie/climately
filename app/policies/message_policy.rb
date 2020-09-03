class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def create? 
      @group = Group.where("chat_id = #{record.chatroom.id}")
      @group.users.include?(user) or user.admin?
    end

    def resolve
      scope.all
    end
  end
end
