class WeatherFacade
  def self.weather(lat,lng)
    weather_data = WeatherService.get_weather(lat, lng)
    Weather.new(weather_data)
  end
end
