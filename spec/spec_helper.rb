ENV["RARANGI_ENV"] = "test"

require 'database_cleaner'
require 'ruby-debug'
require 'rarangi'

RSpec.configure do |config|
  config.before(:suite) do
    if Rarangi.persistance == 'ar'
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end
  end

  config.before(:each) do
    DatabaseCleaner.start if Rarangi.persistance == 'ar'
  end

  config.after(:each) do
    DatabaseCleaner.clean if Rarangi.persistance == 'ar'
  end
end
