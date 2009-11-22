require 'rubygems'
require 'rake'
require 'rake/testtask'

desc 'Default task: run all tests'
task :default => [:test]

task(:set_test_env) { ENV['RACK_ENV'] ||= 'test' }

desc "Run all tests"
Rake::TestTask.new("test") do |t|
  t.libs.concat ['./lib', './test']
  t.test_files = FileList['test/riot_tests/*_test.rb']
  t.verbose = true
end

task "test:shoulda" => [:set_test_env]
desc "Run all Shoulda based tests"
Rake::TestTask.new("test:shoulda") do |t|
  t.libs.concat ['./lib', './test']
  t.test_files = FileList['test/shoulda_tests/*_test.rb']
  t.verbose = true
end

# task :test => [:set_test_env] do
#   $:.concat ['./lib', './test/shoulda_tests']
#   Dir.glob("./test/shoulda_tests/*_test.rb").each { |test| require test }
# end

desc "Open an irb session preloaded with this library"
task :console do
  exec "irb -rubygems"
end

#
# Some monks like diamonds. I like gems.

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "chicago"
    gem.summary = "Sinatra runtime and testing extensions used commonly by Thumblemonks"
    gem.description = "Sinatra runtime and testing extensions used commonly by Thumblemonks. For example, :json_response, which turns an object into JSON and sets the content-type appropriately."
    gem.email = "gus@gusg.us"
    gem.homepage = "http://github.com/thumblemonks/chicago"
    gem.authors = ["Justin 'Gus' Knowlden"]
    gem.add_development_dependency "riot"
    gem.add_development_dependency "rack-test"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end
