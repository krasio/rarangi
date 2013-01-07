When /^I mark "(.*?)" as completed$/ do |content|
  entry = @list.entries.find {|e| e.content == content}
  Rarangi::CompleteEntry.new(entry).exec
end
