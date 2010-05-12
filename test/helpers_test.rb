require 'teststrap'

context "Helpers Test:" do
  setup do
    mock_app {
      helpers Sinatra::Chicago::Helpers
    }
  end

  context "including stylesheet" do
    context "for plain old foo" do
      setup do
        extend_mock_app {
          template(:foo) { "= stylesheet_include('foo')" }
          get('/foo') { haml :foo }
        }
        get '/foo'
      end

      asserts_response_body %r[^<link( \w+=".+"){4}/>$]
      asserts_response_body %r[href="/stylesheets/foo\.css"]
      asserts_response_body %r[media="screen"]
      asserts_response_body %r[rel="stylesheet"]
      asserts_response_body %r[type="text/css"]
    end # for plain old foo

    context "for bar with options" do
      setup do
        extend_mock_app {
          template(:foo) { "= stylesheet_include('bar', :media => 'print', :baz => 'boo')" }
          get('/foo') { haml :foo }
        }
        get '/foo'
      end

      asserts_response_body %r[^<link( \w+=".+"){5}/>$]
      asserts_response_body %r[href="/stylesheets/bar\.css"]
      asserts_response_body %r[media="print"]
      asserts_response_body %r[rel="stylesheet"]
      asserts_response_body %r[type="text/css"]
      asserts_response_body %r[baz="boo"]
    end # for bar with options

    context "with a specific href" do
      setup do
        extend_mock_app {
          template(:foo) { "= stylesheet_include('http://example.com')" }
          get('/foo') { haml :foo }
        }
        get '/foo'
      end
      asserts_response_body %r[href="http://example.com"]
    end # with a specific href
  end # including stylesheets

  context "including javascript" do
    context "for plain old foo" do
      setup do
        extend_mock_app {
          template(:foo) { "= javascript_include('foo')" }
          get('/foo') { haml :foo }
        }
        get '/foo'
      end

      asserts_response_body %r[^<script( \w+=".+"){2}></script>$]
      asserts_response_body %r[src="/javascripts/foo\.js"]
      asserts_response_body %r[type="text/javascript"]
    end # for plain old foo

    context "for foo with options" do
      setup do
        extend_mock_app {
          template(:foo) { "= javascript_include('foo', :type => 'text/blarg', :gus => 'nice')" }
          get('/foo') { haml :foo }
        }
        get '/foo'
      end

      asserts_response_body %r[^<script( \w+=".+"){3}></script>$]
      asserts_response_body %r[src="/javascripts/foo\.js"]
      asserts_response_body %r[type="text/blarg"]
      asserts_response_body %r[gus="nice"]
    end # for foo with options

    context "with a specific src" do
      setup do
        extend_mock_app {
          template(:foo) { "= javascript_include('http://example.com')" }
          get('/foo') { haml :foo }
        }
        get '/foo'
      end
      asserts_response_body %r[src="http://example.com"]
    end # with a specific src
  end # including javascript

  context "using an anchor" do
    context "for plain old foo" do
      setup do
        extend_mock_app {
          template(:foo) { "= anchor('foo', '/bar')" }
          get('/foo') { haml :foo }
        }
        get '/foo'
      end

      asserts_response_body %Q[<a href="/bar">foo</a>\n]
    end # for plain old foo

    context "with options" do
      setup do
        extend_mock_app {
          template(:foo) { "= anchor('foo bear', '/bar/ler', :title => 'gus is nice')" }
          get('/foo') { haml :foo }
        }
        get '/foo'
      end

      asserts_response_body %r[^<a( \w+=".+"){2}>foo bear</a>$]
      asserts_response_body %r[href="/bar/ler"]
      asserts_response_body %r[title="gus is nice"]
    end # with options
  end # using an anchor
end
