class AddDefaultOnUsersPoints < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :points, :integer, default: 0
  end
end
