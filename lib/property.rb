# frozen_string_literal: true

class Property
  def self.all
    [Property.new(description: 'This is a nice place.', price: 100),
     Property.new(description: 'This is a nice place.', price: 100)]
  end

  attr_reader :description, :price

  def initialize(description:, price:)
    @description = description
    @price = price
  end
end
