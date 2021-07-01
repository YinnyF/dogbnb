require 'booking'

describe Booking do
  context '.create' do
    xit 'something' do
      property = Property.create(name: "Marus house", description: "Marus bed is great", price: "200")
    
      Booking.create(property_id: property.id, renter_email: "test@test.com")
    end

  end

end