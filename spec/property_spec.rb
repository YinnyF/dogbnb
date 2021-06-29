# frozen_string_literal: true

require 'property'

describe Property do
  context '.all' do
    it 'returns all properties' do
      Property.new(description: 'This is a nice place.', price: 100)
      Property.new(description: 'This is a nice place.', price: 100)

      properties = Property.all # would like it to be an array of all properties

      expect(properties.length).to eq 2
      expect(properties.first).to be_a Property
    end
  end

  context '#description' do
    it 'returns descriptions' do
      property = Property.new(description: 'This is a nice place.', price: 100)

      expect(property.description).to eq 'This is a nice place.'
    end
  end

  context '#price' do
    it 'returns price' do
      property = Property.new(description: 'This is a nice place.', price: 100)

      expect(property.price).to eq 100
    end
  end
end
