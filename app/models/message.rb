class Message < ApplicationRecord
  belongs_to :chatroom
  has_one_attached :photo
end
