require 'jwt'
class Token
  attr_reader :token

  def initialize
    @token = read_token
  end

  def read_token
    return unless File.exists?("token.txt")
    token = File.readlines("token.txt")
    token.map! { |i| i.chomp }
    token = File.join(token)
  end

  def gener_token_HS256(hmac_secret)
    exp = Time.now.to_i + 60 * 5
    exp_payload = { login: 'test_user', exp: exp }
    token = JWT.encode exp_payload, hmac_secret, 'HS256'
    write_to_file(token)
    return token
  end

  def write_to_file(token)
    File.open("token.txt", "w+").puts(token)
  end

end
