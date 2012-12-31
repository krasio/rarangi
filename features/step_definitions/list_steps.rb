When /^I add "(.*?)" to my list$/ do |content|
  Rarangi::CreateEntry.in_list(@me.list).exec(Rarangi::Entry.new(content))
end

Then /^the list should( not)? be empty$/ do |negative|
  if negative
    expect(@list).not_to be_empty
  else
    expect(@list).to be_empty
  end
end

Then /^the list should have size of (\d+)$/ do |size|
  expect(@list).to have(size).entries
end

Then /^"(.*?)" should be listed$/ do |content|
  expect(@list.entries.map(&:to_s)).to include(content)
end
