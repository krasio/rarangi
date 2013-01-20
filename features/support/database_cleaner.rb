if Rarangi.persistance == 'ar'
  Rarangi.init(YAML::load(File.open('config/database.yml'))[Rarangi.env])
  begin
    require 'database_cleaner'
    require 'database_cleaner/cucumber'

    DatabaseCleaner.strategy = :truncation
  rescue NameError
    raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
  end

  Before do
    DatabaseCleaner.start
  end

  After do
    DatabaseCleaner.clean
  end
end
