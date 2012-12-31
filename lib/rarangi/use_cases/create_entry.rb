module Rarangi
  class CreateEntry
    def self.in_list(list)
      new(list)
    end

    def initialize(list)
      @list = list
    end

    def exec(entry)
      @list << entry
    end
  end
end
