require 'json'

module Chicago
  module Protest
    module Macros
      def asserts_response_status(expected)
        asserts("response status").equals(expected) { last_response.status }
      end
      
      def asserts_content_type(expected)
        asserts("content type").equals(expected) { last_response.headers['Content-type'] }
      end

      def asserts_response_body(expected)
        # TODO: implement a matches operator
        asserts("response body").not do
          expected = %r[#{expected}] if expected.kind_of?(String)
          expected.match(last_response.body).nil?
        end
      end

      def asserts_json_response(json, &block)
        asserts_content_type 'application/json'
        asserts("response body has JSON") do
          json = json.to_json unless json.instance_of?(String)
          last_response.body == json
        end
      end

      # Usage:
      #   assert_redirected_to '/foo/bar'
      def asserts_redirected_to(expected_path)
        asserts_response_status 302
        asserts_location expected_path
        # TODO: implement a matches operator
        # action = expected_path.kind_of?(Regexp) ? 'match' : 'equal'
        # send("assert_#{action}", expected_path, last_response.headers["Location"])
      end

      def asserts_location(expected_path)
        asserts("location header").equals(expected_path) { last_response.headers["Location"] }
      end
    end # Macros
  end # Protest
end # Chicago

Protest::Context.instance_eval { include Chicago::Protest::Macros }