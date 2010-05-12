require 'teststrap'

context "Riot Macros Test:" do
  setup do
    mock_app {
      helpers Sinatra::Chicago::Responders
      get("/redirector") { redirect '/foo/bar' }

      get("/basic-json") do
        content_type 'application/json'
        {:foo => "bar"}.to_json
      end

      get("/json-with-content-type") do
        content_type 'text/javascript', :charset => "utf-8"
        {:foo => "bar"}.to_json
      end
    }
  end

  context "asserts redirected to" do
    setup { get('/redirector') }
    asserts_redirected_to('/foo/bar')
  end # asserts redirected to

  context "json response" do
    context "basic" do
      setup { get('/basic-json') }
      asserts_json_response({:foo => "bar"})
    end # basic

    context "with special content-type" do
      setup { get('/json-with-content-type') }
      asserts_json_response("text/javascript;charset=utf-8", {:foo => "bar"})
    end # with special content-type

    context "with content expectation provided as block" do
      setup { get('/json-with-content-type') }
      asserts_json_response("text/javascript;charset=utf-8") { {:foo => "bar"} }
    end # with special content-type
  end # json response
end
