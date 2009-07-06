require 'rubygems'
require 'rake'
require 'rake/testtask'

desc 'Default task: run all tests'
task :default => [:test]

task(:set_test_env) { ENV['RACK_ENV'] ||= 'test' }

desc "Run all tests"
task :test => [:set_test_env] do
  require 'protest'
  $:.concat ['./lib', './test']
  Dir.glob("./test/*_test.rb").each { |test| require test }
  Protest.report
end

task "test:shoulda" => [:set_test_env]
desc "Run all Shoulda based tests"
Rake::TestTask.new("test:shoulda") do |t|
  t.libs << "test/shoulda_tests"
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
