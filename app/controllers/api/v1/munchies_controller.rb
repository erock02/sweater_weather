class Api::V1::MunchiesController < ApplicationController
  def index
    MunchieFacade.restaurant(params[:location])
  end
end
