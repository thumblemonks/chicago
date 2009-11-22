require 'test_helper'

context "Riot Macros Test:" do
  setup do
    mock_app {
      helpers Sinatra::Chicago::Responders
      get("/redirector") { redirect '/foo/bar' }
    }
  end

  context "asserts redirected to" do
    setup { get('/redirector') }
    asserts_redirected_to('/foo/bar')
  end # asserts redirected to
end
