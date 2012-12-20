module Rarangi
  class List
    def initialize
      @entries = []
    end

    def empty?
      @entries.empty?
    end

    def <<(new_entry)
      @entries << new_entry
    end

    def size
      @entries.size
    end
  end
end
