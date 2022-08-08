class Api::V1::MunchiesController < ApplicationController
  def index
    @munchie = MunchieFacade.restaurant(params[:location], params[:food])
    render json: MunchieSerializer.new(@munchie)
  end
end
