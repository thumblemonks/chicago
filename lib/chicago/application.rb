module Sinatra
  module ThumbleMonks
    module Base

      # Assumes all CSS is SASS and is referenced as being in a directory named stylesheets
      def catch_all_css(path='/stylesheets')
        get("#{path}/*.css") do
          content_type 'text/css'
          sass params["splat"].first.to_sym
        end
      end

      # When you don't want anything special, but to load a named view
      def get_obvious(name)
        get "/#{name}" do
          title = name.to_s
          haml name.to_sym
        end
      end

    end # Base
  end # ThumbleMonks

  register ThumbleMonks::Base
end # Sinatra
