class UserGroup < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :status, inclusion: ["invited", "active", "completed", "failed"]
  validates :status, presence: true
end
