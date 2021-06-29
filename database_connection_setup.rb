require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('dogbnb_test')
else
  DatabaseConnection.setup('dogbnb')
end
