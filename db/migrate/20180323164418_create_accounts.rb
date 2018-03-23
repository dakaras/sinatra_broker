class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
