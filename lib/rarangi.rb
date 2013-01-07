require "minimapper"
require "minimapper/entity"
require "minimapper/repository"

require 'active_record'
require 'logger'

require "rarangi/version"
require "rarangi/entities/user"
require "rarangi/entities/list"
require "rarangi/entities/entry"

require "rarangi/use_cases/create_user"
require "rarangi/use_cases/create_entry"
require "rarangi/use_cases/complete_entry"

module Rarangi
  @env = ENV['RARANGI_ENV'] || 'development'
  @persistance = ENV['RARANGI_PERSISTANCE'] || 'ar'

  def self.env
    @env
  end

  def self.persistance
    @persistance
  end

  def self.setup
    ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml'))[env]) if persistance == 'ar'
  end
end

case Rarangi.persistance
when 'memory'
  require "minimapper/memory"

  require "rarangi/mappers/memory/user_mapper"
  require "rarangi/mappers/memory/list_mapper"
  require "rarangi/mappers/memory/entry_mapper"
when 'ar'
  require "minimapper/ar"

  require "rarangi/mappers/ar"
  require "rarangi/mappers/ar/user_mapper"
  require "rarangi/mappers/ar/list_mapper"
  require "rarangi/mappers/ar/entry_mapper"
end

require "rarangi/repository"

Rarangi.setup
