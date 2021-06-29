# frozen_string_literal: true
require_relative 'database_connection'

class Property
  def self.all
    result = DatabaseConnection.query("SELECT * FROM properties;")

    result.map do |property|
      Property.new(
        id: property['id'],
        description: property['description'],
        price: property['price']
      )
    end
  end

  def self.create(description:, price:)
    result = DatabaseConnection.query("INSERT INTO properties (description, price) VALUES('#{description}','#{price}') RETURNING id, description, price;")
    Property.new(
      id: result[0]['id'],
      description: result[0]['description'],
      price: result[0]['price']
    )
  end

  attr_reader :description, :price, :id

  def initialize(id:, description:, price:)
    @id = id
    @description = description
    @price = price
  end
end
