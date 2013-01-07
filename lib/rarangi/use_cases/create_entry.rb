module Rarangi
  class CreateEntry
    def self.for_list(list)
      new(list)
    end

    def initialize(list)
      @list = list
    end

    def exec(entry)
      @list << entry
      Repository.entries.create(entry)
    end
  end
end
