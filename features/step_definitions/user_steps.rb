Given /^I'm a new user$/ do
  @me = create_user
  @list = @me.list
end

def create_user
  user = Rarangi::User.new
  Repository.users.create(user)
  create_list(user)

  user
end

def create_list(user)
  list = Rarangi::List.new(owner_id: user.id)
  Repository.lists.create(list)
  user.list = list

  list
end
