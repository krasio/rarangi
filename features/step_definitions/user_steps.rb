Given /^I'm a new user$/ do
  @me = create_user('krasio')
  @list = @me.list
end

Given /^there is user named "(.*?)"$/ do |name|
  create_user(name)
end

Then /^"(.*?)" should exists$/ do |name|
  expect(Repository.users.find_by_name(name)).to be
end

Then /^"(.*?)" should have a list$/ do |name|
  expect(Repository.users.find_by_name(name).list).to be
end

def create_user(name)
  Rarangi::CreateUser.new.exec(name)
end
