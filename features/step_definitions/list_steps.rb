Given /^there is a new list$/ do
  @list = Rarangi::List.new
end

When /^(\d+) entr(?:y|ies) (?:is|are) pushed to the list$/ do |n|
  n.to_i.times {@list << Rarangi::Entry.new}
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
