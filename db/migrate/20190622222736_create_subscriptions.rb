class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :uuid, limit: 36, null: false, index: { unique: true }
      t.integer :user_id, null: false
      t.integer :topic_id, null: false

      t.timestamps
    end

    add_index :subscriptions, [:user_id, :topic_id]
  end
end
