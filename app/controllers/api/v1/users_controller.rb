class Api::V1::UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      render status: 201, json: UsersSerializer.new(User.find(user.id))
    else
      render status: 400, json: user.errors.full_messages
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :api_key)
  end
end
