class UserGroup < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :status, inclusion: ["invited", "active", "completed", "failed", "declined"]
  validates :status, presence: true
  validates :user, :uniqueness => { :scope => :group }
end
