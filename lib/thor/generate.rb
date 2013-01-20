require "active_support/inflector"

module Rarangi
  class Generate < Thor
    include Thor::Actions

    attr_accessor :name

    desc "migration [FILE]", "Generate migration file"
    def migration(name)
      @name = name
      prefix = Time.now.strftime "%Y%m%d%H%M%S"
      template("migration.erb.rb", "db/migrate/#{prefix}_#{name}.rb")
    end

    def self.source_root
      "#{File.dirname(__FILE__)}/templates"
    end
  end
end
