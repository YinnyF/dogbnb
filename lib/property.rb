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
        price: property['price'],
        available_from: property['available_from'],
        available_to: property['available_to']
      )
    end
  end

  def self.create(name:, description:, price:, available_from:, available_to:)
    result = DatabaseConnection.query("INSERT INTO properties (name, description, price, available_from, available_to) VALUES('#{name}', '#{description}', '#{price}', '#{available_from}', '#{available_to}') RETURNING id, name, description, price, available_from, available_to;")
    Property.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      available_from: result[0]['available_from'],
      available_to: result[0]['available_to']
    )
  end

  attr_reader :id, :name, :description, :price, :available_from, :available_to

  def initialize(id:, name:, description:, price:, available_from:, available_to:)
    @id = id
    @name = name
    @description = description
    @price = price
    @available_from = available_from
    @available_to = available_to
  end
end
