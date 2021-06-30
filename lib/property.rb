# frozen_string_literal: true
require_relative 'database_connection'

class Property

  def self.all
    result = DatabaseConnection.query("SELECT * FROM properties;")

    result.map do |property|
      Property.new(
        id: property['id'],
        name: property['name'],
        description: property['description'],
        price: property['price']
      )
    end
  end

  def self.create(name:, description:, price:)
    result = DatabaseConnection.query("INSERT INTO properties (name, description, price) VALUES('#{name}', '#{description}','#{price}') RETURNING id, name, description, price;")
    Property.new(
      id: result[0]['id'],
      name: property[0]['name'],
      description: result[0]['description'],
      price: result[0]['price']
    )
  end

  attr_reader :id, :name, :description, :price

  def initialize(id:, name:, description:, price:)
    @id = id
    @name = name
    @description = description
    @price = price
  end
end
