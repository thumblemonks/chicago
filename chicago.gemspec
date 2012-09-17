require "./lib/chicago/version"

Gem::Specification.new do |s|
  s.name          = %q{chicago}
  s.version       = Chicago::VERSION
  s.platform      = Gem::Platform::RUBY

  s.authors       = ["Justin 'Gus' Knowlden"]
  s.summary       = %q{Sinatra testing extensions used commonly by Thumblemonks}
  s.description   = %q{Sinatra testing extensions used commonly by Thumblemonks.}
  s.email         = %q{gus@gusg.us}
  s.homepage      = %q{http://github.com/thumblemonks/chicago}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency(%q<riot>, [">= 0"])
  s.add_dependency(%q<rack-test>, [">= 0"])
end

