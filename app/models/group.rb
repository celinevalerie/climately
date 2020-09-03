class Group < ApplicationRecord
  belongs_to :challenge
  belongs_to :chatroom
  has_many :users_groups
  has_many :users, through: :users_groups
  validates :difficulty, :impact, :duration, :exceptions, presence: true
  validates :difficulty, :inclusion => 1..10
  validates :completed, inclusion: [true, false]
end
