class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.boolean :completed
      t.integer :difficulty
      t.integer :impact
      t.integer :duration
      t.integer :exceptions
      t.integer :points
      t.references :challenge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
