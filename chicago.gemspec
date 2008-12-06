Gem::Specification.new do |s|
  s.name     = "chicago"
  s.version  = "0.1.0"
  s.date     = "2008-12-05"
  s.summary  = "Sinatra runtime and testing extensions used commonly by Thumblemonks"
  s.email    = %w[gus@gusg.us gabriel.gironda@gmail.com]
  s.homepage = "http://github.com/thumblemonks/chicago/tree/master"
  s.description = "Sinatra runtime and testing extensions used commonly by Thumblemonks. For example, :json_response, which turns an object into JSON and sets the content-type appropriately."
  s.authors  = %w[Justin\ Knowlden Gabriel\ Gironda]

  s.has_rdoc = false
  s.rdoc_options = ["--main", "README.markdown"]
  s.extra_rdoc_files = ["HISTORY.txt", "README.markdown"]

  # run git ls-files to get an updated list
  s.files = %w[
  ]
  
  s.test_files = %w[
  ]

  s.add_dependency("sinatra", [">= 0.3.1"])
  s.add_dependency("json", [">= 1.1.3"])
end