class Group < ApplicationRecord
  belongs_to :challenge
  belongs_to :chatroom
  has_many :user_groups
  has_many :users, through: :user_groups
  validates :duration, :exceptions, presence: true
  # validates :difficulty, :inclusion => 1..10
  validates :completed, inclusion: [true, false]
end
