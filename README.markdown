# Chicago

    It's my kind of town!
    - Sinatra

Yeah, we're real clever. We're also from ["The city in mid-west best city in the whole wide wide world"](http://www.azlyrics.com/lyrics/lupefiasco/gogogadgetflow.html) ... which makes us double the clever.

Chicago is a collection of test extensions and helpers that makes some common tasks in Sinatra a little bit easier.

## Installation

Installing chicago is a quick gem install:

    gem install chicago

## Usage

### Sinatra testing

If you're using [Riot](http://github.com/thumblemonks/riot) in your tests of your Sinatra app, do this:

    require 'chicago/riot'

... and you'll get a bunch of cool Riot macros for testing specific Sinatra stuff:

* asserts_response
* asserts_response_status
* asserts_content_type
* asserts_response_body
* asserts_location
* asserts_json_response
* asserts_redirected_to

