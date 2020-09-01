class UserGroup < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :participating, inclusion: [true, false]
end
