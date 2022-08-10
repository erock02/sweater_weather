class Route
  attr_reader :id,
              :travel_time,
              :days,
              :hours,
              :start_city,
              :end_city

  def initialize(route_data, from, to)
    @id = "null"
    @travel_time = "#{route_data[:route][:formattedTime][0..1]} hours, #{route_data[:route][:formattedTime][3..4]} minutes"
    @hours = route_data[:route][:formattedTime][0..1].to_i % 24
    @days = route_data[:route][:formattedTime][0..1].to_i / 24
    @start_city = from
    @end_city = to
  end

  def weather_at_eta
    @location = MapFacade.location(@end_city)
    @weather = WeatherFacade.weather(@location.latitude, @location.longitude)
    if @hours == 0
    {
      temperature: @weather.current_weather[:temperature],
      conditions: @weather.current_weather[:conditions]
    }
    elsif @hours < 8
      {
        temperature: @weather.hourly_weather[@hours][:temperature],
        conditions: @weather.hourly_weather[@hours][:conditions]
      }
    elsif @days < 4
      {
        temperature: @weather.daily_weather[@days][:max_temp],
        conditions: @weather.daily_weather[@days][:conditions]
      }
    else
      "weather data is unavailable"
    end

  end
end
