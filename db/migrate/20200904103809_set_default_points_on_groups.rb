class SetDefaultPointsOnGroups < ActiveRecord::Migration[6.0]
  def change
    change_column :groups, :points, :integer, default: 0
  end
end
