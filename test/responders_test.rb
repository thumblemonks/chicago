require File.join(File.dirname(__FILE__), 'test_helper')

class RespondersTest < Test::Unit::TestCase

  context "json response" do
    setup do
      get_it "/json_bait"
    end

    should_have_response_status 201
    should_have_json_response({:foo => :bar})
  end # json response

end
