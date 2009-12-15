require 'chicago/riot/macros'
require 'rack/test'

class Riot::Situation
  include Rack::Test::Methods

  # Allows Rack test methods to work in your Riot tests. Simply do this in your setup or test method:
  #
  #   context "MyApp" do
  #     setup { @app = MyApp }
  #
  #     context "get /foo" do
  #       setup { get "/foo" }
  #       # ... tests ...
  #     end
  #   end
  def app
    @app
  end

  # Sets up a Sinatra::Base subclass defined with the block given. Used in setup or individual test methods
  # to define an application
  #
  #   context "get /foo" do
  #     setup do
  #       mock_app {
  #         get("/foo") { stuff; status 200; }
  #       }
  #       get "/foo"
  #     end
  #     asserts_response_status 200
  #   end
  def mock_app(base=Sinatra::Base, &block)
    @app = Sinatra.new(base, &block)
  end
end
