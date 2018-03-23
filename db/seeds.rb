# Seed the database with `rake db:seed`

# Users
michael = User.create(username: 'mike_009', email: 'michael@gmail.com', password: 'test123')
raphael = User.create(username: 'ralph_001', email: 'raphael@yahoo.com', password: 'angel45')
gabriel = User.create(username: 'gabriel_022', email: 'gabriel@hotmail.com', password: 'alpha09')

# Stocks
general_electric = Stock.create(name: 'General Electric', ticker: 'GE')
apple = Stock.create(name: 'Apple', ticker: 'APPL')
microsoft = Stock.create(name: 'Microsoft', ticker: 'MSFT')

# Accounts
Account.create(name:'speculative', user_id: "#{michael.id}", stocks_id: ["#{apple.id}"], category: "growth")
Account.create(name:'retirement', user_id: "#{michael.id}", stocks_id: ["#{general_electric.id}"], category: "value")
Account.create(name:'Gabriel', user_id: "#{gabriel.id}", stocks_id: ["#{microsoft.id}"], category: "growth")
