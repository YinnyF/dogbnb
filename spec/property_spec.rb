# frozen_string_literal: true

require 'property'
require 'database_helpers'

describe Property do
  context '.all' do
    it 'returns all properties' do
      user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
      Property.create(
        name: 'Marus house', description: 'Marus bed is great', price: '200',
        available_from: '2021-07-02', available_to: '2022-07-02',
        owner_id: user.id, image_route: 'test.jpg'
      )
      Property.create(
        name: 'Marus house', description: 'Marus bed is great', price: '200',
        available_from: '2021-07-02', available_to: '2022-07-02',
        owner_id: user.id, image_route: 'test.jpg'
      )
      properties = Property.all

      expect(properties.length).to eq 2
      expect(properties.first).to be_a Property
    end
  end
end

describe Property do
  context '.create' do
    it 'creates a new property' do
      user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
      property = Property.create(
        name: 'Marus Crib', description: 'Marus bed is great', price: '200',
        available_from: '2021-07-02', available_to: '2022-07-02',
        owner_id: user.id, image_route: 'test.jpg'
      )
      persisted_data = persisted_data(table: 'properties', id: property.id.to_s)

      expect(property).to be_a Property
      expect(property.id).to eq persisted_data.first['id']
      expect(property.description).to eq 'Marus bed is great'
      expect(property.price).to eq '200.00'
      expect(property.name).to eq 'Marus Crib'
      expect(property.available_from).to eq '2021-07-02'
      expect(property.available_to).to eq '2022-07-02'
      expect(property.owner_id).to eq user.id
    end
  end
end

describe Property do
  describe '.who' do
    it 'gets the relevant user from the database' do
      user = User.create(name: 'Testname', email: 'test@example.com', password: 'password123')
      property = Property.create(
        name: 'Marus Crib', description: 'This is a nice place',
        price: '200', available_from: '2021-07-02', available_to: '2022-07-02',
        owner_id: user.id, image_route: 'test.jpg'
      )
      Property.who(property_id: property.id)

      persisted_data = persisted_data(table: 'properties', id: property.id.to_s)

      expect(property).to be_a Property
      expect(property.id).to eq persisted_data.first['id']
      expect(property.description).to eq 'This is a nice place'
      expect(property.price).to eq '200.00'
      expect(property.name).to eq 'Marus Crib'
      expect(property.available_from).to eq '2021-07-02'
      expect(property.available_to).to eq '2022-07-02'
      expect(property.owner_id).to eq user.id
    end
  end
end
