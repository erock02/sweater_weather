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
    @hours = route_data[:route][:formattedTime][0..1].to_i
    @start_city = from
    @end_city = to
  end

  def weather_at_eta
    @location = MapFacade.location(@end_city)
    @weather = WeatherFacade.weather(@location.latitude, @location.longitude)
    if @hours > 0 && @hours < 9
      {
        temperature: @weather.hourly_weather[@hours][:temp],
        conditions: @weather.hourly_weather[@hours][:description]
      }
    end

  end
end
