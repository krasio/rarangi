Given /^I'm a new user$/ do
  @me = Rarangi::User.new
  @list = Rarangi::List.new(user: @me)
  @me.list = @list
end
