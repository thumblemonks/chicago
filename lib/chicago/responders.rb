module Thumblemonks
  module Sinatra
    module Responders

      # Returns a JSON response for an object
      def json_response(object)
        content_type 'application/json'
        object.to_json
      end

    end # Responders
  end # Sinatra
end # Thumblemonks

Sinatra::Base.instance_eval { include Thumblemonks::Sinatra::Responders }
