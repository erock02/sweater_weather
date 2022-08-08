require 'rails_helper'

RSpec.describe WeatherFacade, :vcr do
  describe 'Facade methods' do
    it '.weather returns a weather poro of the location provided' do
      weather = WeatherFacade.weather(38.89, -77.01)
      expect(weather).to be_a(Weather)
    end
  end
end
