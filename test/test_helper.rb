require 'rubygems'

require 'shoulda'

require 'sinatra/base'
require 'sinatra/test'
require 'sinatra/test/unit'

require 'chicago'
require 'chicago/shoulda'

module Sinatra::Test
  # Sets up a Sinatra::Base subclass defined with the block
  # given. Used in setup or individual spec methods to establish
  # the application.
  def mock_app(base=Sinatra::Base, &block)
    @app = Sinatra.new(base, &block)
  end
end
