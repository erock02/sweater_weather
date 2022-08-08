class BaseService
  def self.conn_map
    Faraday.new(url: "http://www.mapquestapi.com") do |req|
      req.params['key'] = ENV['map_api_key']
    end
  end

  def self.conn_weather
    Faraday.new(url: "https://api.openweathermap.org") do |req|
      req.params['appid'] = ENV['weather_api_key']
    end
  end

  def self.conn_yelp
    Faraday.new(url: "https://api.yelp.com") do |req|
      req.headers["Authorization"] = ENV['yelp_api_key']
    end
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
