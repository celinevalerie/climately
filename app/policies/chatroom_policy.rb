class ChatroomPolicy < ApplicationPolicy

  def show? 
    @group = Group.where("chat_id = #{record.id}")
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
