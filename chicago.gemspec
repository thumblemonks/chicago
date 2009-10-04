Gem::Specification.new do |s|
  s.name     = "chicago"
  s.version  = "0.3.5"
  s.date     = "2009-10-04"
  s.summary  = "Sinatra runtime and testing extensions used commonly by Thumblemonks"
  s.email    = %w[gus@gusg.us gabriel.gironda@gmail.com]
  s.homepage = "http://github.com/thumblemonks/chicago/tree/master"
  s.description = "Sinatra runtime and testing extensions used commonly by Thumblemonks. For example, :json_response, which turns an object into JSON and sets the content-type appropriately."
  s.authors  = %w[Justin\ Knowlden Gabriel\ Gironda]

  s.has_rdoc = true
  s.rdoc_options = ["--main", "README.markdown"]
  s.extra_rdoc_files = ["README.markdown"]

  # run git ls-files to get an updated list
  s.files = %w[
    MIT-LICENSE
    README.markdown
    chicago.gemspec
    lib/chicago.rb
    lib/chicago/application.rb
    lib/chicago/helpers.rb
    lib/chicago/responders.rb
    lib/chicago/riot.rb
    lib/chicago/riot/macros.rb
    lib/chicago/shoulda.rb
    lib/chicago/shoulda/sinatra.rb
  ]
  
  s.test_files = %w[
    Rakefile
    test/application_test.rb
    test/helpers_test.rb
    test/protest_macros_test.rb
    test/responders_test.rb
    test/shoulda_tests/application_test.rb
    test/shoulda_tests/helpers_test.rb
    test/shoulda_tests/responders_test.rb
    test/shoulda_tests/test_helper.rb
    test/test_helper.rb
  ]
end
