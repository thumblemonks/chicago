%w[ rubygems riot haml sass chicago rack/test chicago/riot ].each do |lib|
  require lib
end

module Rack::Test::Methods
  # Sets up a Sinatra::Base subclass defined with the block
  # given. Used in setup or individual spec methods to establish
  # the application.
  def mock_app(base=Sinatra::Base, &block)
    @app = Sinatra.new(base, &block)
  end

  def extend_mock_app(&block)
    @_rack_test_session ||= Rack::Test::Session.new(app)
    @app.instance_eval(&block)
  end

  def app
    @app
  end
end

class Riot::Situation
  include Rack::Test::Methods
end

at_exit { Riot.report }
