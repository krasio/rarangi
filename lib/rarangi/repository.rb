module Rarangi
  # Repository = Minimapper::Repository.build({
  #   users: Rarangi::Memory::UserMapper.new,
    # lists: Rarangi::Memory::ListMapper.new,
    # entries: Rarangi::Memory::EntryMapper.new
  # })
  Repository = Minimapper::Repository.build({
    users: Rarangi::AR::UserMapper.new,
    lists: Rarangi::AR::ListMapper.new,
    entries: Rarangi::AR::EntryMapper.new
  })
end
