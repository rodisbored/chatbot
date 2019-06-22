class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :uuid, limit: 36, null: false
      t.string :username, null: false
      t.string :crypted_password
      t.string :salt
      t.string :email, null: false

      t.string :first_name
      t.string :last_name

      t.integer :locale, default: 0

      t.timestamps
    end
  end
end
