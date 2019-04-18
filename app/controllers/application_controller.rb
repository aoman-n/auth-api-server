class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include SessionsHelper

  def hello
    puts 'hello!'
    log('log helper')
    render json: { text: 'Hello World' }
  end

  private

  def logged_in_user
    unless logged_in?
      render json: { error: 'Unauthorized' }, status: 401
    end
  end

end
