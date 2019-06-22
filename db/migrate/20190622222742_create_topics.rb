class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :uuid, limit: 36, null: false
      t.string :name
      t.timestamps
    end
  end
end
