require File.join(File.dirname(__FILE__), 'test_helper')

context "RespondersTest" do

  setup do
    mock_app {
      helpers Sinatra::Chicago::Responders
      get "/json_bait" do
        status(201)
        json_response({:foo => "bar"})
      end
    }
  end

  context "json response" do
    setup do
      get "/json_bait"
    end

    asserts_response_status 201
    asserts_json_response({:foo => :bar})
  end # json response

end
