module Sinatra
  module Chicago
    module Helpers
      # A basic anchor (link_to) tag
      #
      # Exmaples:
      #
      #   anchor('GusGus', 'http://gusg.us')
      #   => <a href="http://gusg.us">GusG.us</a>
      #
      #   anchor('GusGus', 'http://gusg.us', :title => 'You know who!')
      #   => <a href="http://gusg.us" title="You know who!">GusG.us</a>
      def anchor(name, url, options={})
        defaults = {:href => url}
        options_str = hash_to_attributes(defaults.merge(options))
        %Q[<a #{options_str}>#{name}</a>]
      end

      # A helper to include stylesheet links. Currently defaults everything to
      # load from a /stylesheets directory.
      #
      # Exmaples:
      #
      #   stylesheet_include('foo')
      #   => <link href="/stylsheets/foo.css" media="screen" rel="stylesheet" type="text/css" />
      #
      #   stylesheet_include('foo/bar')
      #   => <link href="/stylsheets/foo/bar.css" media="screen" rel="stylesheet" type="text/css" />
      #
      #   stylesheet_include('foo', :media => "print")
      #   => <link href="/stylsheets/foo.css" media="print" rel="stylesheet" type="text/css" />
      #
      #   stylesheet_include('http://example.com/foo.css')
      #   => <link href="http://example.com/foo.css" media="print" rel="stylesheet" type="text/css" />
      def stylesheet_include(name, options={})
        name = "/stylesheets/#{name}.css" unless remote_asset?(name)
        defaults = {:href => name, :media => "screen",
          :rel => "stylesheet", :type => "text/css"}
        options_str = hash_to_attributes(defaults.merge(options))
        %Q[<link #{options_str}/>]
      end

      # A helper to include javascript source tags. Currently defaults everything
      # to load from a /javascripts directory.
      #
      # Exmaples:
      #
      #   javascript_include('foo')
      #   => <javascript src="/javascripts/foo.js" type="text/javascript"></script>
      #
      #   javascript_include('foo/bar')
      #   => <javascript src="/javascripts/foo/bar.js" type="text/javascript"></script>
      #
      #   javascript_include('foo', :something => "great")
      #   => <javascript src="/javascripts/foo.js" type="text/javascript" something="great"></script>
      #
      #   javascript_include('http://example.com/foo.js')
      #   => <javascript src="http://example.com/foo.js" type="text/javascript"></script>
      def javascript_include(name, options={})
        name = "/javascripts/#{name}.js" unless remote_asset?(name)
        defaults = {:src => name, :type => "text/javascript"}
        options_str = hash_to_attributes(defaults.merge(options))
        %Q[<script #{options_str}></script>]
      end
    private
      def remote_asset?(uri)
        uri =~ %r[^\w+://.+]
      end

      def hash_to_attributes(options)
        options.map {|k,v| "#{k}=\"#{v}\""}.join(' ')
      end
    end # Helpers
  end # Chicago

  helpers Chicago::Helpers
end # Sinatra
