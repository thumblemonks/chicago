module Sinatra
  module Chicago

      # Assumes all CSS is SASS and is referenced as being in a directory named stylesheets
      # If SASS file is not defined, the route will passed on to - theoretically - the real
      # CSS in the public directory.
      def catch_all_css(path='/stylesheets')
        get("#{path}/*.css") do
          begin
            content_type 'text/css'
            sass params["splat"].first.to_sym
          rescue Errno::ENOENT
            pass
          end
        end
      end

      # When you don't want anything special, but to load a named view as HAML.
      def get_obvious(name)
        get "/#{name}" do
          haml name.to_sym
        end
      end

  end # Chicago

  register Chicago
end # Sinatra
