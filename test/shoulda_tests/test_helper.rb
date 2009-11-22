%w[ rubygems test/unit shoulda haml sass chicago rack/test chicago/shoulda ].each do |lib|
  require lib
end

class Test::Unit::TestCase
  include Rack::Test::Methods

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
end
