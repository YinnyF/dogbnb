# frozen_string_literal: true

# :nodoc:
class Booking
  def self.create(property_id:, renter_id:, owner_id:)
    result = DatabaseConnection.query(
      "INSERT INTO bookings (property_id, renter_id, owner_id)
      VALUES('#{property_id}', '#{renter_id}','#{owner_id}')
       RETURNING id, property_id, renter_id, owner_id;"
    )
    Booking.new(
      id: result[0]['id'],
      property_id: result[0]['property_id'],
      renter_id: result[0]['renter_id'],
      owner_id: result[0]['owner_id']
    )
  end

  attr_reader :id, :property_id, :renter_id, :owner_id

  def initialize(id:, property_id:, renter_id:, owner_id:)
    @id = id
    @property_id = property_id
    @renter_id = renter_id
    @owner_id = owner_id
  end
end
