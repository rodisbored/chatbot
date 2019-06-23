class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :uuid, limit: 36, null: false, index: { unique: true }
      t.string :name, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
