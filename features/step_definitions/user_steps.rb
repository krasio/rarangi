Given /^I'm a new user$/ do
  @me = create_user('krasio')
  @list = @me.list
end

Given /^there is user named "(.*?)"$/ do |name|
  create_user(name)
end

Then /^"(.*?)" should exists$/ do |name|
  expect(Rarangi::Repository.users.find_by_email("#{name}@rarangi.com")).to be
end

Then /^"(.*?)" should have a list$/ do |name|
  expect(Rarangi::Repository.users.find_by_email("#{name}@rarangi.com").list).to be
end

def create_user(name)
  Rarangi::CreateUser.new.exec("#{name}@rarangi.com")
end
