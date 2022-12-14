require 'rails_helper'

RSpec.describe MapService, :vcr do
  describe 'connection' do
    it 'establishes the connection to The Movie Database' do
      expect(MapService.conn_map).to be_a(Faraday::Connection)
    end
  end

  describe 'map endpoints' do
    it '.get_location returns a json for location details' do
      json_return = MapService.get_location("Denver,CO")
      expect(json_return).to be_a(Array)
      expect(json_return.first[:locations].first[:latLng]).to be_a(Hash)
    end

    it '.get_route returns a json for given two locations' do
      json_return = MapService.get_route("Denver,CO", "Aspen,CO")
      expect(json_return).to be_a(Hash)
      expect(json_return).to have_key(:route)
      expect(json_return[:route]).to have_key(:formattedTime)
    end
  end
end
