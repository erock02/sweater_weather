class Api::V1::MunchiesController < ApplicationController
  def index
    if params[:location] && params[:food] && params[:location] != "" && params[:food] != ""
      @munchie = MunchieFacade.restaurant(params[:location], params[:food])
      render json: MunchieSerializer.new(@munchie)
    else
      render status: 400
    end
  end
end
