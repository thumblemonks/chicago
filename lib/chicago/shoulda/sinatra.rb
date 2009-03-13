require 'json'
require 'ostruct'

module ThumbleMonks
  module Shoulda
    module Sinatra

      def self.included(klass)
        klass.extend(Macros)
        klass.send(:include, Helpers)
      end

      module Macros
        def should_have_response_status(expected)
          should("have response status") { assert_response expected }
        end
      
        def should_have_response_body(expected)
          name = expected.is_a?(String) ? expected[0...15] : expected.to_s
          should("have response body like #{name}") { assert_response_body expected }
        end

        def should_have_content_type(expected)
          should("have content_type") { assert_content_type expected }
        end

        def should_have_json_response(json={}, &block)
          should_have_content_type 'application/json'
          should "have JSON response in the body" do
            json = self.instance_eval(&block) if block_given?
            json = json.to_json unless json.instance_of?(String) || json.instance_of?(Regexp)
            assert_response_body json
          end
        end
      end # Macros

      module Helpers
        def deny(check, message=nil)
          assert(!check, message)
        end

        def assert_response(status)
          assert_equal status, @response.status
        end

        def assert_response_body(body)
          assert_match body, @response.body
        end

        def assert_content_type(expected)
          assert_equal expected, @response.headers['Content-type']
        end

        # Usage:
        #
        # assert_redirected_to '/foo/bar'
        #   or
        # assert_redirected_to %r[foo.bar]
        def assert_redirected_to(expected_path)
          yield if block_given?
          assert_response 302
          action = expected_path.kind_of?(Regexp) ? 'match' : 'equal'
          send("assert_#{action}", expected_path, @response.headers["Location"])
        end
      end # Helpers

    end # Sinatra
  end # Shoulda
end # ThumbleMonks

Test::Unit::TestCase.instance_eval { include ThumbleMonks::Shoulda::Sinatra }
