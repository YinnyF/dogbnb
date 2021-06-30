require 'listing'

describe Listing do
  describe '.all' do
    it 'returns all listings' do
      listings = Listing.all

      expect(listings).to include ("Maru's Crib")
      expect(listings).to include ("Maru's Garage")
    end
  end

  # describe '.create' do
  #   it 'creates a new listing' do
  #     Listing.create(name: "Maru's Poolhouse")

  #     expect(Listing.all).to include "Maru's Poolhouse"
  #   end
  # end
end