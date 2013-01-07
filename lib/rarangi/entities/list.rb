module Rarangi
  class List
    include Minimapper::Entity

    attributes :owner_id
    attr_reader :entries, :owner

    def initialize(attributes = {})
      super
      @entries = []
    end

    def owner=(owner)
      @owner = owner
      self.owner_id = @owner.id
    end

    def empty?
      entries.empty?
    end

    def <<(new_entry)
      new_entry.tap do |e|
        e.list = self
        entries << e
      end
    end

    def size
      entries.size
    end
  end
end
