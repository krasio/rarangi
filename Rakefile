require 'bundler/gem_tasks'
require "cucumber/rake/task"
require "rspec/core/rake_task"

namespace :rarangi do
  require "./lib/tasks/env"
  require "./lib/tasks/db"
  require "./lib/tasks/test"
end

desc "Run all the tests!"
task default: %w[rarangi:test]
