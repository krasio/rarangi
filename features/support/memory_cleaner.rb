if Rarangi.persistance == 'memory'
  Before do
    [:users, :lists, :entries].each {|r| Rarangi::Repository.send(r).delete_all}
  end
end
