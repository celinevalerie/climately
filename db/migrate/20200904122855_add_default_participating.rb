class AddDefaultParticipating < ActiveRecord::Migration[6.0]
  def change
    change_column :user_groups, :participating, :boolean, default: true
  end
end
