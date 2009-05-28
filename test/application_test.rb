require File.join(File.dirname(__FILE__), 'test_helper')

class ApplicationTest < Test::Unit::TestCase

  context "catching all css" do
    context "with default path" do
      setup do
        mock_app {
          catch_all_css
          template :foo do
            ".bar\n  :display none"
          end
        }
        get '/stylesheets/foo.css'
      end

      should_have_response_status 200
      should_have_content_type 'text/css'
      should_have_response_body %r[.bar \{\s+display: none; \}\s]
    end

    context "with specified path" do
      setup do
        mock_app {
          catch_all_css('/css')
          template :goo do
            ".car\n  :display some"
          end
        }
        get '/css/goo.css'
      end

      should_have_response_status 200
      should_have_content_type 'text/css'
      should_have_response_body %r[.car \{\s+display: some; \}\s]
    end

    context "with path that's not a defined a sass file" do
      setup do
        mock_app { catch_all_css }
        get '/stylesheets/goo.css'
      end

      should_have_response_status 404
      should_have_content_type 'text/html'
    end
  end # catching all css

  context "getting obvious views" do
    setup do
      mock_app {
        get_obvious 'baz'
        template :baz do
          "Whatever man. That's just like, your opinion."
        end
      }
      get '/baz'
    end

    should_have_response_body "Whatever man. That's just like, your opinion."
  end

end
