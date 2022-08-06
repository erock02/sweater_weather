require 'rails_helper'

RSpec.describe MapFacade, :vcr do
  describe 'Facade methods' do
    it '.location returns a location poro of the location provided' do
      location = MapFacade.location("Denver,CO")
      expect(location).to be_a(Location)
    end
  end
end
