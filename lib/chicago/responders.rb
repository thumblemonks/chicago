module Sinatra
  module Chicago
    module Responders

      # Returns a JSON response for an object. Will return an empty string if the provided object is nil.
      def json_response(object)
        content_type 'application/json'
        object ? object.to_json : ""
      end

    end # Responders
  end # Chicago

  helpers Chicago::Responders
end # Sinatra
