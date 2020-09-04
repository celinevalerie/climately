class SetDefaultOnGroups < ActiveRecord::Migration[6.0]
  def change
    change_column :groups, :completed, :boolean, default: false
  end
end
