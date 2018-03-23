# Seed the database with `rake db:seed`

# Users
michael = User.create(username: 'mike_009', email: 'michael@gmail.com', password: 'test123')
raphael = User.create(username: 'ralph_001', email: 'raphael@yahoo.com', password: 'angel45')
gabriel = User.create(username: 'gabriel_022', email: 'gabriel@hotmail.com', password: 'alpha09')

# Stocks
general_electric = Stock.create(name: 'General Electric', ticker: 'GE')
apple = Stock.create(name: 'Apple', ticker: 'APPL')
microsoft = Stock.create(name: 'Microsoft', ticker: 'MSFT')
standard = Stock.create(name: 'S&P500', ticker: 'SPY')

# Accounts
Account.create(name:'speculative', user_id: "#{michael.id}", stocks_id: ["#{apple.id}"], category: "Growth")
Account.create(name:'retirement', user_id: "#{michael.id}", stocks_id: ["#{general_electric.id}"], category: "Value")
Account.create(name:'tech', user_id: "#{gabriel.id}", stocks_id: ["#{microsoft.id}"], category: "Growth")
Account.create(name:'beta', user_id:"#{{raphael.id}}", stocks_id: ["#{standard.id}"], category: "Index")
