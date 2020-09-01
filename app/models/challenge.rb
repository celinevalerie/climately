class Challenge < ApplicationRecord
  has_many :groups
  validates :name, :description, presence: true
end
