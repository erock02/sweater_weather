require 'rails_helper'

RSpec.describe YelpService, :vcr do
  describe 'connection' do
    it 'establishes the connection to The Movie Database' do
      expect(YelpService.conn_yelp).to be_a(Faraday::Connection)
    end
  end

  describe 'yelp endpoints' do
    it '.get_weather returns a json for location weather' do
      json_return = YelpService.get_search_results("denver,co", "chinese")
      expect(json_return).to be_a(Hash)
    end
  end
end
