require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :rspec => :spec

task :play do
  ruby "bin/labyrinth"
end

task :test do
  ruby "spec/model_tests.rb"
end