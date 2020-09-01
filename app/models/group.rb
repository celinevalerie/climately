class Group < ApplicationRecord
  belongs_to :challenge, dependent: :destroy
  has_many :groups, through: :users_groups

    validates :completed, inclusion: { in:[true, false] }
  validates:difficulty, :impact, :duration, :exceptions, presence: true
  validates_inclusion_of :difficulty, :in => 1..10
end
