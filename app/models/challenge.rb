class Challenge < ApplicationRecord
  has_many :groups
  validates :name, :description, presence: true
  has_one_attached :photo
end
