require 'booking'
require 'database_helpers'

describe Booking do
  context '.create' do
    it 'something' do
      owner = User.create(name: 'Ownername', email: 'owner@example.com', password: 'password123')
      renter = User.create(name: 'Rentername', email: 'renter@example.com', password: 'password1234')
      property = Property.create(name: "Marus house", description: "Marus bed is great", price: "200",available_from: '2021-07-02', available_to: '2022-07-02', owner_id: owner.id )
    
      booking = Booking.create(property_id: property.id, renter_id: renter.id, owner_id: owner.id)
      persisted_data = persisted_data(table: 'bookings', id: booking.id)

      expect(booking).to be_a Booking
      expect(booking.renter_id).to eq renter.id
      expect(booking.owner_id).to eq owner.id
      expect(booking.id).to eq persisted_data.first['id'] 
    end
  end

end