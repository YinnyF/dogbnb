# frozen_string_literal: true

require 'property'
require 'database_helpers'

describe Property do
  context '.all' do
    it 'returns all properties' do
      Property.create(description: 'This is a nice place 1', price: 100, name: 'Marus Crib', available_from: '2021-07-02', available_to: '2022-07-02')
      Property.create(description: 'This is a nice place 2', price: 100, name: 'Marus Penthouse', available_from: '2021-07-02', available_to: '2022-07-02') 

      properties = Property.all # would like it to be an array of all properties

      expect(properties.length).to eq 2
      expect(properties.first).to be_a Property
    end
  end

  context '.create' do
    it 'creates a new property' do
      property = Property.create(description: 'This is a nice place.', price: 100, name: 'Marus Crib', available_from: '2021-07-02', available_to: '2022-07-02')
      persisted_data = persisted_data(table: 'properties', id: property.id.to_s)

      expect(property).to be_a Property
      expect(property.id).to eq persisted_data.first['id']
      expect(property.description).to eq 'This is a nice place.'
      expect(property.price).to eq '100.00'
      expect(property.name).to eq 'Marus Crib'
      expect(property.available_from).to eq '2021-07-02'
      expect(property.available_to).to eq '2022-07-02'
    end
  end

  context '#name' do
    it 'returns name' do
      property = Property.create(name: 'Marus Crib', description: 'This is a nice place.', price: 100, available_from: '2021-07-02', available_to: '2022-07-02')
  
      expect(property.name).to eq 'Marus Crib'
    end
  end

  context '#description' do
    it 'returns description' do
      property = Property.create(name: 'Marus Crib', description: 'This is a nice place.', price: 100, available_from: '2021-07-02', available_to: '2022-07-02')

      expect(property.description).to eq 'This is a nice place.'
    end
  end

  context '#price' do
    it 'returns price' do
      property = Property.create(name: 'Marus Crib', description: 'This is a nice place.', price: 100, available_from: '2021-07-02', available_to: '2022-07-02')

      expect(property.price).to eq '100.00'
    end
  end

  context '#available_from' do
    it 'returns when property is available from' do
      property = Property.create(name: 'Marus Crib', description: 'This is a nice place.', price: 100, available_from: '2021-07-02', available_to: '2022-07-02')

      expect(property.available_from).to eq '2021-07-02'
    end
  end

  context '#available_to' do
    it 'returns when property is available until' do
      property = Property.create(name: 'Marus Crib', description: 'This is a nice place.', price: 100, available_from: '2021-07-02', available_to: '2022-07-02')

      expect(property.available_to).to eq '2022-07-02'
    end
  end

end
