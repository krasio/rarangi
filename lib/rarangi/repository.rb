Repository = Minimapper::Repository.build({
  users: Rarangi::UserMapper.new,
  lists: Rarangi::ListMapper.new,
  entries: Rarangi::EntryMapper.new
})
