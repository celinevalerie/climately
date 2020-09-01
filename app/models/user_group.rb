class UserGroup < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :participation, inclusion: { in:[true, false] }
end
