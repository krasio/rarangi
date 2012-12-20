module Rarangi
  class List
    attr_reader :entries

    def initialize
      @entries = []
    end

    def empty?
      entries.empty?
    end

    def <<(new_entry)
      entries << new_entry
    end

    def size
      entries.size
    end
  end
end
