class Api::V1::MunchiesController < ApplicationController
  def index
    render json: MunchieFacade.restaurant(params[:location], params[:food])
  end
end
