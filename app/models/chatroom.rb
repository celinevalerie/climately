class Chatroom < ApplicationRecord
  has_one :group
  has_many :messages
end
