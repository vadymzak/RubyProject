require_relative "token"
require_relative "check"

key = 'my$ecretK3y'
t = Token.new
#---Check token---------------------
#=begin
check = Check.new(t.token, key)
unless check.decode_HS256 == false
  puts check.decode
else
  puts "Token not valid"
end
#=end
#------------------------------------
#---Generate new token---------------
#print t.gener_token_HS256(key)
#------------------------------------
#---Print token----------------------
#print t.token
