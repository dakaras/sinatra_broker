# sinatra_broker

ActiveRecord Associations

User has many Accounts
User has many Stocks, through Accounts

Account belongs to the User
Account has many Stocks, through AccountStocks

AccountStocks belongs to Stocks
AccountStocks belongs to Account

Stocks has many AccountStocks
Stocks has many Accounts, through AccountStocks
Stocks has many Users
