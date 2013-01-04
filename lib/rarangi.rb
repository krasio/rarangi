require "minimapper"
require "minimapper/entity"
require "minimapper/memory"
require "minimapper/repository"

require 'active_record'
require 'logger'

require "rarangi/version"
require "rarangi/entities/user"
require "rarangi/entities/list"
require "rarangi/entities/entry"

require "rarangi/mappers/memory/user_mapper"
require "rarangi/mappers/memory/list_mapper"
require "rarangi/mappers/memory/entry_mapper"

require "rarangi/use_cases/create_entry"
require "rarangi/use_cases/create_user"

require "rarangi/repository"

module Rarangi
  @env = ENV['RARANGI_ENV'] || 'development'

  def self.env
    @env
  end

  def self.setup
    ActiveRecord::Base.establish_connection(YAML::load(File.open('config/database.yml'))[env])
  end
end

Rarangi.setup
