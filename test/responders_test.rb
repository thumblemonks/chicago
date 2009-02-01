require File.join(File.dirname(__FILE__), 'test_helper')

class RespondersTest < Test::Unit::TestCase

  context "json response" do
    setup do
      mock_app {
        get "/json_bait" do
          status(201)
          json_response({:foo => "bar"})
        end
      }
      get "/json_bait"
    end

    should_have_response_status 201
    should_have_json_response({:foo => :bar})
  end # json response

end
