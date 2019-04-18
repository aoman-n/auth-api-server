require 'jwt'

class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      user.remember
      secret = ENV['HMAC_SECRET'] || 'hmac_jwt'
      payload = {
        user_id: user.id,
        token: user.remember_token
      }
      j_token = JWT.encode payload, secret, 'HS256'
      render json: { message: "Account activated!!", token: j_token }
    else
      render json: { status: "Invalid activation link" }, status: 400
    end
  end

end
