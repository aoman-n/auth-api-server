require 'jwt'

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include SessionsHelper

  before_action :authenticate!, except: [:hello]

  def hello
    puts 'hello!'
    log('log helper')
    render json: { text: 'Hello World' }
  end

  private

  def token_from_header
    return nil if request.headers['Authorization'].blank? or request.headers['Authorization'] !~ /\ABearer .*\z/
    request.headers['Authorization'].match(/\ABearer (.*)\z/)[1]
  end

  def decode_token(token)
    secret = ENV['HMAC_SECRET'] || 'hmac_jwt'
    JWT.decode(token, secret, true, { algorithm: 'HS256' }).first
  end

  def authenticate!
    token = token_from_header
    render json: { error: 'Unauthorized' }, status: 401 if token.nil?
    decoded_token = decode_token(token)
    user = User.find_by(id: decoded_token['user_id'])
    if user && user.authenticated?(:remember, decoded_token['token'])
      render json: user, status: 200
    else
      render json: { error: 'Unauthorized' }, status: 401
    end
  end

  def current_user
    @current_user ||= User.find_by(token: request.headers['Authorization'].split[1])
  end

end
