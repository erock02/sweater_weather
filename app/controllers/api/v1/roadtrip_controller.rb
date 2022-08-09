class Api::V1::RoadtripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      @route = MapFacade.route(params[:origin], params[:destination])
      render json: RoadtripSerializer.new(@route)
    else
      render status: 400
    end
  end
end
