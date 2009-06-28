require 'test_helper'

context "Responders Test:" do
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
    setup { get "/json_bait" }
    asserts_response_status 201
    asserts_json_response({:foo => :bar})
  end # json response
end
