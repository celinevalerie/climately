class Chatroom < ApplicationRecord
  has_many :groups
  has_many :messages
end
