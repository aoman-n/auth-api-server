require 'jwt'

class UsersController < ApplicationController
  before_action :logged_in_user, only: [:me]

  def create
    secret = ENV['HMAC_SECRET'] || 'hmac_jwt'
    @user = User.new(user_params)
    if @user.save
      @user.remember
      payload = {
        user_id: @user.id,
        token: @user.remember_token
      }
      j_token = JWT.encode payload, secret, 'HS256'
      puts 'token: '
      render json: { token: j_token }
    else
      render json: { errors: @users.errors.full_messages }, status: 400
    end
  end

  def me
    render json: current_user
  end

  private

    def user_params
      params.permit(:name, :email, :password)
    end

end
