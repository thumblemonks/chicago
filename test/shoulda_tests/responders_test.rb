require 'shoulda_tests/test_helper'

class RespondersTest < Test::Unit::TestCase
  def app
    @app = mock_app {
      helpers Sinatra::Chicago::Responders
      get "/json_bait" do
        status(201)
        json_response({:foo => "bar"})
      end

      get "/no_bait" do
        status(200)
        json_response(nil)
      end
    }
  end

  context "json response" do
    setup { get "/json_bait" }
    should_have_json_response({:foo => :bar})
  end # json response

  context "json response with null data" do
    setup { get "/no_bait" }
    should_have_json_response(/^$/)
  end # json response
end
