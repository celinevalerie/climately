class Challenge < ApplicationRecord
  has_many :groups
  validates :name, :description, :icon
end
