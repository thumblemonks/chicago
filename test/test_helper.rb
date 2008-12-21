require 'rubygems'

require 'sinatra'
require 'sinatra/test/unit'
require 'shoulda'

require 'chicago'
require 'chicago/shoulda'

# JSON Stuff
get "/json_bait" do
  status(201)
  json_response({:foo => "bar"})
end

# CSS Stuff

catch_all_css
template :foo do
  ".bar\n  :display none"
end

catch_all_css('/css')
template :goo do
  ".car\n  :display some"
end

# Getting obvious

get_obvious 'baz'
template :baz do
  "Whatever man. That's just like, your opinion."
end

# Helpers

