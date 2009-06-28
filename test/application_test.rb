require File.join(File.dirname(__FILE__), 'test_helper')

context "ApplicationTest:" do

  setup do
    mock_app {
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
      setup do
        get '/stylesheets/foo.css'
      end

      asserts_response_status 200
      asserts_content_type 'text/css'
      asserts_response_body %r[.bar \{\s+display: none; \}\s]
    end

    context "with specified path" do
      setup do
        get '/css/goo.css'
      end

      asserts_response_status 200
      asserts_content_type 'text/css'
      asserts_response_body %r[.car \{\s+display: some; \}\s]
    end

    context "with path that's not a defined a sass file" do
      setup do
        get '/stylesheets/zoo.css'
      end

      asserts_response_status 404
      asserts_content_type 'text/html'
    end
  end # catching all css

  context "getting obvious views" do
    setup { get '/baz' }
    asserts_response_body "Whatever man. That's just like, your opinion."
  end # getting obvious views

end
