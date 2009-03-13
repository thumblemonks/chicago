require 'rubygems'

require 'haml'
require 'sinatra'
require 'test/unit'
require 'sinatra/test'

require 'shoulda'

require 'chicago'
require 'chicago/shoulda'

module Sinatra::Test
  # Sets up a Sinatra::Base subclass defined with the block
  # given. Used in setup or individual spec methods to establish
  # the application.
  def mock_app(base=Sinatra::Default, &block)
    @app = Sinatra.new(base, &block)
  end
end

class Test::Unit::TestCase
  include Sinatra::Test
end
