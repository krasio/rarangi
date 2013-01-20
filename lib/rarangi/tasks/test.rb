namespace :test do
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
