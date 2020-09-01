class Group < ApplicationRecord
  belongs_to :challenge, dependent: :destroy
  has_many :groups, through: :users_groups

    
  validates :difficulty, :impact, :duration, :exceptions, :completed,presence: true
  validates :difficulty, :inclusion => 1..10
  validates :completed, inclusion: [true, false]
end
