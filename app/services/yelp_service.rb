class WeatherService < BaseService
  def self.get_search_results(lat, lng)
    response = conn_yelp.get("/businesses/search?latitude=#{lat}&longitude=#{lng}")
    json = get_json(response)
  end
end
