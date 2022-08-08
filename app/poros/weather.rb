class Weather
  attr_reader :id

  def initialize(weather_data)
    @id = "null"
    @weather_data = weather_data
  end

  def current_weather
    current_weather_hash = {
      datetime: Time.at(@weather_data[:current][:dt]),
      sunrise: Time.at(@weather_data[:current][:sunrise]),
      sunset: Time.at(@weather_data[:current][:sunset]),
      temp: @weather_data[:current][:temp],
      feels_like: @weather_data[:current][:feels_like],
      humidity: @weather_data[:current][:humidity],
      uvi: @weather_data[:current][:uvi],
      visibility: @weather_data[:current][:visibility],
      description: @weather_data[:current][:weather][0][:description]
    }
  end

  def hourly_weather
    @hourly_array = Array.new(0)
    @weather_data[:hourly].first(8).each do |forecast|
      @hourly_array << {
          time: Time.at(forecast[:dt]).strftime("%H:%M:%S") ,
          temp: forecast[:temp],
          description: forecast[:weather][0][:description],
          icon: forecast[:weather][0][:icon]
        }
    end
    @hourly_array
  end

  def daily_weather
    @daily_array = Array.new(0)
    @weather_data[:daily].first(5).each do |forecast|
    @daily_array << {
      date: Time.at(forecast[:dt]).strftime("%m-%d-%Y"),
      sunrise: Time.at(forecast[:sunrise]),
      sunset: Time.at(forecast[:sunset]),
      max_temp: forecast[:temp][:max],
      min_temp: forecast[:temp][:min],
      conditions: forecast[:weather][0][:description],
      icon: forecast[:weather][0][:icon]
    }
    end
    @daily_array
  end
end
