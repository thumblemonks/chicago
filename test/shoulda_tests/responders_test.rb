require 'test_helper'

class RespondersTest < Test::Unit::TestCase
  def app
    @app = mock_app {
      helpers Sinatra::Chicago::Responders
      get "/json_bait" do
        status(201)
        json_response({:foo => "bar"})
      end
    }
  end

  context "json response" do
    setup { get "/json_bait" }
    should_have_response_status 201
    should_have_json_response({:foo => :bar})
  end # json response
end
