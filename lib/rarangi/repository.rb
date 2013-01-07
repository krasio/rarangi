module Rarangi
  MapperNamespace = case persistance
           when 'memory'
             Rarangi::Memory
           when 'ar'
             Rarangi::AR
           end
  Repository = Minimapper::Repository.build({
    users: MapperNamespace::UserMapper.new,
    lists: MapperNamespace::ListMapper.new,
    entries: MapperNamespace::EntryMapper.new
  })
end
