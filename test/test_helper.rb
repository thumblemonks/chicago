require 'rubygems'

require 'sinatra'
require 'sinatra/test/unit'
require 'shoulda'

require 'chicago'
require 'chicago/shoulda'

get "/json_bait" do
  status(201)
  json_response({:foo => "bar"})
end
