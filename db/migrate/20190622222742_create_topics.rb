class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :uuid, limit: 36, null: false, index: { unique: true }
      t.string :name, null: false
      t.integer :group_id, null: false
      t.timestamps
    end

    add_index :topics, [:group_id, :id]
  end
end
