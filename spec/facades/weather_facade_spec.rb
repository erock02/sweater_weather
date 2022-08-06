require 'rails_helper'

RSpec.describe WeatherFacade, :vcr do
  describe 'Facade methods' do
    it '.location returns a location poro of the location provided' do
      location = WeatherFacade.weather(38.89, -77.01)
      expect(location).to be_a(Weather)
    end
  end
end
