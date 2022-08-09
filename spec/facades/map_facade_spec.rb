require 'rails_helper'

RSpec.describe MapFacade, :vcr do
  describe 'Facade methods' do
    it '.location returns a location poro of the location provided' do
      location = MapFacade.location("Denver,CO")
      expect(location).to be_a(Location)
    end

    it '.route returns a route poro of the locations provided' do
      route = MapFacade.route("Denver,CO", "Aspen,CO")
      expect(route).to be_a(Route)
    end
  end
end
