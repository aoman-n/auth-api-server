require 'jwt'

module AuthorizationModule

  def create_token_for_login(user)
    secret = ENV['HMAC_SECRET'] || 'hmac_jwt'
    user.remember
    payload = {
      user_id: user.id,
      token: user.remember_token
    }
    JWT.encode payload, secret, 'HS256'
  end

  def get_http_header_token
    request.headers['Authorization'].match(/\ABearer (.*)\z/)[1]
  end

  def decod_token(j_token)
    secret = ENV['HMAC_SECRET'] || 'hmac_jwt'
    JWT.decode(token, secret, true, { algorithm: 'HS256' }).first
    user = User.find_by(id: decoded_token['user_id'])
  end

end