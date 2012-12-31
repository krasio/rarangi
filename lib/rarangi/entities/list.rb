module Rarangi
  class List
    attr_reader :entries, :owner

    def initialize(attributes = {})
      @entries = []
      if owner = attributes[:owner]
        @owner = owner
      end
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
