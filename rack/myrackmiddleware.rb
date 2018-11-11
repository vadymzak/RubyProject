class MyRackMiddleware
  attr_reader :request

  def initialize(appl)
    @appl = appl
  end

  def call(env)
    request(env)
    status, headers, body = @appl.call(env) # we now call the inner application
    params = @request.GET
    token = params.each do |key, value|
      if key == "token"
        token = value
      end
    end
    p token.class
    append_s = token.to_s#@request.GET.to_s #@request#{}"... greetings from RubyLearning!!"
    [status, headers, body << append_s]
  end

  def request(env)
    @request = Rack::Request.new(env)
  end


end
