class Munchie

  def initialize(restaurant_data)
    @id = "null"
    @destination_city = "#{restaurant_data[:city]}, #{restaurant_data[:state]}"
    @restaurant = {restaurant: {
      name: restaurant_data[:businesses][0][:name],
      address: restaurant_data[:businesses][0][:location][:display_address][0]
      }
    }
  end

  def forecast
    @location = MapFacade.location(params[@destination_city])
    @weather = WeatherFacade.weather(@location.latitude, @location.longitude)
    current_array = {
      summary: @weather.current_weather[:description],
      temperature: @weather.current_weather[:temp]
    }
  end
end
