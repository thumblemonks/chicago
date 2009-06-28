# Chicago

    It's my kind of town!
    - Sinatra

Yeah, we're real clever. We're also from ["The city in mid-west best city in the whole wide wide world"](http://www.azlyrics.com/lyrics/lupefiasco/gogogadgetflow.html) ... which makes us double the clever.

## What what?

### Sinatra runtime app

In your Sinatra app, do this:

    require 'chicago'

And you'll get some helpful Sinatra extensions and helpers.

If you're Sinatra app is considered modular - as in, you are not using the `Sinatra::Default` app - you will want to add the following in your app:

    YourApp < Sinatra::Base
      register Sinatra::Chicago            # for some DSL helpers
      helpers Sinatra::Chicago::Helpers    # for standard helpers
      helpers Sinatra::Chicago::Responders # for JSON assistance
    end

You don't necessarily need all of them. You just need to "include" the statements that mix-in the functionality you want.

### Sinatra testing

Assuming you have required 'rack/test', like so:

    require 'rack/test'

This is because these macros use last_request defined by the Rack/Test library. If you're using [Protest](http://github.com/thumblemonks/protest) in your tests of your Sinatra app, do this:

    require 'chicago/protest'

... and you'll get a bunch of cool Protest macros for testing specific Sinatra stuff.

If you're using Shoulda in your tests of your Sinatra app, do this:

    require 'chicago/shoulda'

... and you'll get a bunch of cool Shoulda macros for testing specific Sinatra stuff.
