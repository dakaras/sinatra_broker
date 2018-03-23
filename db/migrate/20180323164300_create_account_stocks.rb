class CreateAccountStocks < ActiveRecord::Migration[5.1]
  def change
    create_table :account_stocks do |t|
      t.integer :account_id
      t.integer :stock_id   #join table only has foreign keys
    end
  end
end
