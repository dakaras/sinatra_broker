class Account < ActiveRecord::Base
  belongs_to :user
  has_many :account_stocks
  has_many :stocks, through: :account_stocks

  validates_presence_of :name, :category
end
