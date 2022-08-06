class Weather

  def initialize(weather_data)
    @current_weather = weather_data[:current]
    @hourly_weather = weather_data[:hourly]
    @daily_weather = weather_data[:daily]
  end
end
