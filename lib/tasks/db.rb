namespace :db do
  desc "Create the database defined in config/database.yml for the current DB or RARANGI_ENV"
  task create: :env do
    env = ENV["DB"] || Rarangi.env
    config = YAML::load(File.open('config/database.yml'))[env]
    ActiveRecord::Base.establish_connection(config.merge('database' => 'postgres'))
    ActiveRecord::Base.connection.create_database(config['database'])
  end

  desc "Drops the database for the current DB or RARANGI_ENV"
  task :drop do
    require 'rarangi'
    env = ENV["DB"] || Rarangi.env
    config = YAML::load(File.open('config/database.yml'))[env]
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ActiveRecord::Base.establish_connection(config.merge('database' => 'postgres'))
    ActiveRecord::Base.connection.drop_database config['database']
  end

  desc "Migrate the database through scripts in db/migrate"
  task(migrate: :env) do
    ActiveRecord::Migrator.migrate('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
    Rake::Task["rarangi:db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
  end

  namespace :migrate do
    desc 'Runs the "down" for a given migration VERSION'
    task(down: :env) do
      ActiveRecord::Migrator.down('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
      Rake::Task["rarangi:db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end

    desc 'Runs the "up" for a given migration VERSION'
    task(up: :env) do
      ActiveRecord::Migrator.up('db/migrate', ENV["VERSION"] ? ENV["VERSION"].to_i : nil )
      Rake::Task["rarangi:db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end

    desc "Rollbacks the database one migration"
    task(rollback: :env) do
      ActiveRecord::Migrator.rollback('db/migrate', 1 )
      Rake::Task["rarangi:db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end

    desc "Rollbacks the database one migration and re-migrate up"
    task(redo: :env) do
      ActiveRecord::Migrator.rollback('db/migrate', 1 )
      ActiveRecord::Migrator.up('db/migrate', nil )
      Rake::Task["rarangi:db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
    end
  end

  namespace :schema do
    task dump: :env do
      require 'active_record/schema_dumper'
      File.open(ENV['SCHEMA'] || "db/schema.rb", "w") do |file|
        ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
      end
    end
  end
end
