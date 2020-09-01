class Group < ApplicationRecord
  belongs_to :challenge
  has_many :users, through: :users_groups
  has_many :users_groups   
  validates :difficulty, :impact, :duration, :exceptions, :completed, presence: true
  validates :difficulty, :inclusion => 1..10
  validates :completed, inclusion: [true, false]
end
