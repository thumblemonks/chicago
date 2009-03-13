module Sinatra
  module Thumblemonks
    module Responders

      # Returns a JSON response for an object
      def json_response(object)
        content_type 'application/json'
        object.to_json
      end

    end # Responders
  end # Thumblemonks

  helpers Thumblemonks::Responders
end # Sinatra
