class Challenge < ApplicationRecord
  has_many :groups
  has_one_attached :photo
end
