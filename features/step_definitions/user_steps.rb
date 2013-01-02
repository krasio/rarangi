Given /^I'm a new user$/ do
  @me = create_user
  @list = @me.list
end

Given /^there is user named "(.*?)"$/ do |name|
  Rarangi::CreateUser.new.exec(name)
end

Then /^"(.*?)" should exists$/ do |name|
  expect(Repository.users.find_by_name(name)).to be
end

Then /^"(.*?)" should have a list$/ do |name|
  expect(Repository.users.find_by_name(name).list).to be
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
