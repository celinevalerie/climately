class Group < ApplicationRecord
  belongs_to :challenge, dependent: :destroy
  has_many :groups, through: :users_groups
end
