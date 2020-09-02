class Challenge < ApplicationRecord
  has_many :groups
  has_one_attached :photo

  validates :name, :description, presence: true
  validates :category, inclusion: ["Waste", "Food", "Mobility", "Others"]
  validates :default_difficulty, :inclusion => 1..10
  validates :default_impact, :inclusion => 1..10
end
