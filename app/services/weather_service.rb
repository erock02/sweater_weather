class WeatherService < BaseService
  def self.get_weather(lat, lng)
    response = conn_weather.get("data/3.0/onecall?lat=#{lat}&lon=#{lng}&units=imperial")
    json = get_json(response)
  end
end
