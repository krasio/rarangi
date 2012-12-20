Given /^there is a new list$/ do
  @list = Rarangi::List.new
end

When /^one entry is pushed to the list$/ do
  @list << Rarangi::Entry.new
end

Then /^the list should be empty$/ do
  expect(@list).to be_empty
end

Then /^the list should not be empty$/ do
  expect(@list).not_to be_empty
end

Then /^the list should have size of (\d+)$/ do |size|
  expect(@list).to have(size).items
end
