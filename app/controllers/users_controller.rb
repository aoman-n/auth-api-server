class UsersController < ApplicationController
  skip_before_action :authenticate!, only: [ :create ]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
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
