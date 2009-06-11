module Sinatra
  module Chicago
    module Responders

      # Returns a JSON response for an object
      def json_response(object)
        content_type 'application/json'
        object.to_json
      end

    end # Responders
  end # Chicago

  helpers Chicago::Responders
end # Sinatra
