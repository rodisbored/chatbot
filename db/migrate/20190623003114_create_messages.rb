class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :uuid, limit: 36, null: false, index: { unique: true }
      t.integer :user_id
      t.integer :topic_id
      t.string :content
      t.timestamps
    end
  end
end
