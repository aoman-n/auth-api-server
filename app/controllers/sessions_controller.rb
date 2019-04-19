class SessionsController < ApplicationController

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = create_token_for_login(@user)
      render json: { token: token }
    else
      render json: { errors: @user.errors.full_messages }, status: 401
    end
  end

  def destroy
    log_out if logged_in?
    render json: { message: "success log out" }
  end

end
