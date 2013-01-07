def add_to_list(content)
  Rarangi::CreateEntry.for_list(@me.list).exec(Rarangi::Entry.new(content: content))
  @list = Rarangi::Repository.lists.find(@me.list.id)
  @me.list = @list
end

When /^I add "(.*?)" to my list$/ do |content|
  add_to_list(content)
end

Given /^"(.*?)" is in my list$/ do |content|
  add_to_list(content)
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

Then /^"(.*?)" should be listed as( not)? completed?$/ do |content, negative|
  entry = @list.entries.find {|e| e.content == content}
  expect(entry).to be_persisted
  if negative
    expect(entry).not_to be_completed
  end
end
