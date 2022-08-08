class Munchie
  attr_reader :id,
              :destination_city,
              :restaurant

  def initialize(restaurant_data)
    @id = "null"
    @restaurant_data = restaurant_data
    @destination_city = "#{@restaurant_data[:businesses][0][:location][:city]}, #{@restaurant_data[:businesses][0][:location][:state]}"
    @restaurant = {
      name: @restaurant_data[:businesses][0][:name],
      address: @restaurant_data[:businesses][0][:location][:display_address][0]
    }
  end

  def forecast
    @location = MapFacade.location(@destination_city)
    @weather = WeatherFacade.weather(@location.latitude, @location.longitude)
    current_array = {
      summary: @weather.current_weather[:description],
      temperature: @weather.current_weather[:temp].to_s
    }
  end
end
