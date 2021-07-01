# frozen_string_literal: true

require 'property'
require 'database_helpers'

describe Property do
  context '.all' do
    it 'returns all properties' do
      user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
      Property.create(description: 'This is a nice place 1', price: 100, name: 'Marus Crib', owner_id: user.id)
      Property.create(description: 'This is a nice place 2', price: 100, name: 'Marus Penthouse', owner_id: user.id) 

      properties = Property.all # would like it to be an array of all properties

      expect(properties.length).to eq 2
      expect(properties.first).to be_a Property
    end
  end

  context '.create' do
    it 'creates a new property' do
      user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
      property = Property.create(description: 'This is a nice place.', price: 100, name: 'Marus Crib', owner_id: user.id)
      persisted_data = persisted_data(table: 'properties', id: property.id.to_s)

      expect(property).to be_a Property
      expect(property.id).to eq persisted_data.first['id']
      expect(property.description).to eq 'This is a nice place.'
      expect(property.price).to eq '100.00'
      expect(property.name).to eq 'Marus Crib'
      expect(property.owner_id).to eq user.id
    end
  end

  context '#description' do
    it 'returns descriptions' do
      user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
      property = Property.create(description: 'This is a nice place.', price: 100, name: 'Marus Crib', owner_id: user.id)

      expect(property.description).to eq 'This is a nice place.'
    end
  end

  context '#price' do
    it 'returns price' do
      user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
      property = Property.create(description: 'This is a nice place.', price: 100, name: 'Marus Crib', owner_id: user.id)

      expect(property.price).to eq '100.00'
    end
  end

  context '#name' do
    it 'returns name' do
      user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
      property = Property.create(description: 'This is a nice place.', price: 100, name: 'Marus Crib', owner_id: user.id)

      expect(property.name).to eq 'Marus Crib'
    end
  end

  describe '.who' do
    it 'gets the relevant user from the database' do
      user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
      property = Property.create(description: 'This is a nice place.', price: 100, name: 'Marus Crib', owner_id: user.id)
      returned_property = Property.who(property_id: property.id)
      
      persisted_data = persisted_data(table: "properties", id: "#{property.id}")

      expect(property).to be_a Property
      expect(property.id).to eq persisted_data.first['id']
      expect(property.description).to eq 'This is a nice place.'
      expect(property.price).to eq '100.00'
      expect(property.name).to eq 'Marus Crib'
      expect(property.owner_id).to eq user.id
    end
  end
end
