# frozen_string_literal: true

require 'property'

describe Property do
  context '.all' do
    xit 'returns all properties' do
      Property.create(description: 'This is a nice place 1', price: 100)
      Property.create(description: 'This is a nice place 2', price: 100 )

      properties = Property.all # would like it to be an array of all properties

      expect(properties.length).to eq 2
      expect(properties.first).to be_a Property
    end
  end

  context '.create' do
    xit 'creates a new property' do
      property = Property.create(description: "This is a nice place", price: 100)
      persisted_data = DatabaseConnection.query("SELECT * FROM properties WHERE id = #{property.id};")


      expect(property).to be_a Property
      expect(property.id).to eq persisted_data.first['id']
      expect(property.description).to eq "This is a nice place"
      expect(property.price).to eq "100"
    end
  end

  context '#description' do
    xit 'returns descriptions' do
      property = Property.create(description: 'This is a nice place.', price: 100 )

      expect(property.description).to eq 'This is a nice place.'
    end
  end

  context '#price' do
    xit 'returns price' do
      property = Property.create(description: 'This is a nice place.', price: 100)

      expect(property.price).to eq "100"
    end
  end
end
