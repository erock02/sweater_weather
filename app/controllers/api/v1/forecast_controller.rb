class Api::V1::ForecastController < ApplicationController
  def index
    @location = MapFacade.location(params[:location])
    @weather = WeatherFacade.weather(@location.latitude, @location.longitude)
    render json: ForecastSerializer.new(@weather)
  end
end
