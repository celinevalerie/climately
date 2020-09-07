class ChangeColumnParticipatingInUserGroups < ActiveRecord::Migration[6.0]
  def change
    change_column :user_groups, :participating, :string, default: 'invited'
    rename_column :user_groups, :participating, :status
  end
end
