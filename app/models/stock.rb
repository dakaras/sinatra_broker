class Stock < ActiveRecord::Base
  has_many :account_stocks
  has_many :stocks, through: :account_stocks
  has_many :users, through: :account_stocks
end
