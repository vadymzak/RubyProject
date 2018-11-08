require 'jwt'

class Check
  def initialize(token)
    @token = token
    @hmac_secret = 'my$ecretK3y'
  end

  def decode_HS256
    begin
      decoded_token = JWT.decode @token, @hmac_secret, true, { algorithm: 'HS256' }
      puts decoded_token
    rescue JWT::ExpiredSignature
      # Handle expired token, e.g. logout user or deny access
      puts "Token no valid"
    end
  end

end
