require 'test_helper'

context "Riot Macros Test:" do
  setup do
    mock_app {
      helpers Sinatra::Chicago::Responders
      get("/redirecter") { redirect '/foo/bar' }
    }
  end

  context "asserts redirected to" do
    setup { get('/redirecter') }
    asserts_redirected_to('/foo/bar')
  end # asserts redirected to
end
