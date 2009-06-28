require 'rubygems'
require 'rake'

desc 'Default task: run all tests'
task :default => [:test]

task(:set_test_env) { ENV['SINATRA_ENV'] ||= 'test' }

task :environment do
  # Nothing yet
end

desc "Run all tests"
task :test => [:set_test_env, :environment] do
  require 'protest'
  $:.concat ['./lib', './test']
  Dir.glob("./test/*_test.rb").each { |test| require test }
  Protest.run
end

desc "Open an irb session preloaded with this library"
task :console do
  exec "irb -rubygems"
end
