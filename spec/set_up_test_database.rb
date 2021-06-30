require 'pg'

def set_up_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'dogbnb_test')

  connection.exec("TRUNCATE users, properties;")
end
