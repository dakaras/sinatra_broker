class AccountStock < ActiveRecord::Base
  belongs_to :stock
  belongs_to :account
end
