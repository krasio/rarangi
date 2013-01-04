module Rarangi
  Repository = Minimapper::Repository.build({
    users: Rarangi::Memory::UserMapper.new,
    lists: Rarangi::Memory::ListMapper.new,
    entries: Rarangi::Memory::EntryMapper.new
  })
end
