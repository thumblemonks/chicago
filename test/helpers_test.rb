require File.join(File.dirname(__FILE__), 'test_helper')

class HelpersTest < Test::Unit::TestCase
  context "including stylesheets" do
    should_invoke_helper(:stylesheet_include, 'foo') do
      assert_match %r[^<link( \w+=".+"){4}/>$], @response.body
      assert_match %r[href="/stylesheets/foo\.css"], @response.body
      assert_match %r[media="screen"], @response.body
      assert_match %r[rel="stylesheet"], @response.body
      assert_match %r[type="text/css"], @response.body
    end

    should_invoke_helper(:stylesheet_include, 'bar', :media => 'print', :baz => 'boo') do
      assert_match %r[^<link( \w+=".+"){5}/>$], @response.body
      assert_match %r[href="/stylesheets/bar\.css"], @response.body
      assert_match %r[media="print"], @response.body
      assert_match %r[rel="stylesheet"], @response.body
      assert_match %r[type="text/css"], @response.body
      assert_match %r[baz="boo"], @response.body
    end

    should_invoke_helper(:stylesheet_include, 'http://example.com') do
      assert_match %r[href="http://example.com"], @response.body
    end
  end # including stylesheets

  context "including javascript" do
    should_invoke_helper(:javascript_include, 'foo') do
      assert_match %r[^<script( \w+=".+"){2}></script>$], @response.body
      assert_match %r[src="/javascripts/foo\.js"], @response.body
      assert_match %r[type="text/javascript"], @response.body
    end

    should_invoke_helper(:javascript_include, 'foo', :type => "text/blarg", :gus => "nice") do
      assert_match %r[^<script( \w+=".+"){3}></script>$], @response.body
      assert_match %r[src="/javascripts/foo\.js"], @response.body
      assert_match %r[type="text/blarg"], @response.body
      assert_match %r[gus="nice"], @response.body
    end

    should_invoke_helper(:javascript_include, 'http://example.com') do
      assert_match %r[src="http://example.com"], @response.body
    end
  end # including javascript

  context "using an anchor" do
    should_invoke_helper(:anchor, 'foo', '/bar') do
      assert_equal %Q[<a href="/bar">foo</a>], @response.body
    end

    should_invoke_helper(:anchor, 'foo bear', '/bar/ler', :title => "gus is nice") do
      assert_match %r[^<a( \w+=".+"){2}>foo bear</a>$], @response.body
      assert_match %r[href="/bar/ler"], @response.body
      assert_match %r[title="gus is nice"], @response.body
    end
  end # using an anchor
end
