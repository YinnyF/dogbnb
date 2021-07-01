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
        owner_id: property['owner_id']
      )
    end
  end

  def self.create(name:, description:, price:, owner_id:)
    result = DatabaseConnection.query("INSERT INTO properties (name, description, price, owner_id) VALUES('#{name}', '#{description}','#{price}', '#{owner_id}') RETURNING id, name, description, price, owner_id;")
    Property.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      owner_id: result[0]['owner_id']
    )
  end

  def self.who(property_id:)
    result = DatabaseConnection.query("SELECT * FROM properties WHERE id = #{property_id};")
    Property.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      owner_id: result[0]['owner_id']
    )
  end
    
  attr_reader :id, :name, :description, :price, :owner_id

  def initialize(id:, name:, description:, price:, owner_id:)
    @id = id
    @name = name
    @description = description
    @price = price
    @owner_id = owner_id
  end
end
