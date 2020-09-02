class AddColumnsToChallenges < ActiveRecord::Migration[6.0]
  def change
    add_column :challenges, :category, :string
    add_column :challenges, :default_difficulty, :integer
    add_column :challenges, :default_impact, :integer
  end
end
