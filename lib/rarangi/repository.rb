module Rarangi
  Mapper = case persistance
           when 'memory'
             Rarangi::Memory
           when 'ar'
             Rarangi::AR
           end
  Repository = Minimapper::Repository.build({
    users: Mapper::UserMapper.new,
    lists: Mapper::ListMapper.new,
    entries: Mapper::EntryMapper.new
  })
end
