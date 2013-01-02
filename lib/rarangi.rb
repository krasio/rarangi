require "minimapper"
require "minimapper/entity"
require "minimapper/memory"
require "minimapper/repository"

require "rarangi/version"
require "rarangi/entities/user"
require "rarangi/entities/list"
require "rarangi/entities/entry"

require "rarangi/mappers/user_mapper"
require "rarangi/mappers/list_mapper"
require "rarangi/mappers/entry_mapper"

require "rarangi/use_cases/create_entry"

require "rarangi/repository"

module Rarangi
  @env = ENV['RARANGI_ENV'] || 'development'

  def self.env
    @env
  end
end
