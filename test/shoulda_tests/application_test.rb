require 'shoulda_tests/test_helper'

class ApplicationTest < Test::Unit::TestCase

  def app
    @app = mock_app {
      register Sinatra::Chicago

      template(:foo) { ".bar\n  :display none" }
      template(:goo) { ".car\n  :display some" }
      template(:baz) { "Whatever man. That's just like, your opinion." }

      catch_all_css
      catch_all_css('/css')

      get_obvious 'baz'
    }
  end

  # TODO: change to namespace
  context "catching all css" do
    context "with default path" do
      setup { get '/stylesheets/foo.css' }
      should_have_response_status 200
      should_have_content_type 'text/css'
      should_have_response_body %r[.bar \{\s+display: none; \}\s]
    end

    context "with specified path" do
      setup { get '/css/goo.css' }
      should_have_response_status 200
      should_have_content_type 'text/css'
      should_have_response_body %r[.car \{\s+display: some; \}\s]
    end

    context "with path that's not a defined a sass file" do
      setup { get '/stylesheets/zoo.css' }
      should_have_response_status 404
      should_have_content_type 'text/css'
    end
  end # catching all css

  context "getting obvious views" do
    setup { get '/baz' }
    should_have_response_body "Whatever man. That's just like, your opinion."
  end # getting obvious views

end
