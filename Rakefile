require 'bundler/gem_tasks'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

namespace :test do |ns|
  Cucumber::Rake::Task.new(:features)

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.pattern = ['spec/**/*_spec.rb']
  end

  RSpec::Core::RakeTask.new(:unit) do |t|
    t.pattern = ['unit/**/*_spec.rb']
  end
end

desc "Run all the tests!"
task test: %w[test:unit test:spec test:features]

desc "Run all the tests!"
task default: %w[test]
