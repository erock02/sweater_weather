require 'rails_helper'

RSpec.describe WeatherService, :vcr do
  describe 'connection' do
    it 'establishes the connection to The Movie Database' do
      expect(WeatherService.conn_weather).to be_a(Faraday::Connection)
    end
  end

  describe 'weather endpoints' do
    it '.get_weather returns a json for location weather' do
      json_return = WeatherService.get_weather(38.89, -77.01)
      expect(json_return).to be_a(Hash)
    end
  end
end
