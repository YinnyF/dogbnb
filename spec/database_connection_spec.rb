require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'dogbnb_test')

      DatabaseConnection.setup('dogbnb_test')
    end

    it 'this connection is persistent' do
      # grab the connection as a return value from the .setup method
      connection = DatabaseConnection.setup('dogbnb_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe '.query' do
    it 'executes a query via PG' do
      connection = DatabaseConnection.setup('dogbnb_test')

      expect(connection).to receive(:exec).with("SELECT * FROM users;")

      DatabaseConnection.query("SELECT * FROM users;")
    end
  end
end
