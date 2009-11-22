%w[ rubygems riot haml sass chicago sinatra/test chicago/riot ].each do |lib|
  require lib
end

class Riot::Situation
  include Sinatra::Test

  alias_method :last_response, :response

  # Sets up a Sinatra::Base subclass defined with the block
  # given. Used in setup or individual spec methods to establish
  # the application.
  def mock_app(base=Sinatra::Base, &block)
    @app = Sinatra.new(base, &block)
  end

  def extend_mock_app(&block)
    @app.instance_eval(&block)
  end

  def app
    @app
  end
end
