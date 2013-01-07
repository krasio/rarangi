module Rarangi
  class Entry
    include Minimapper::Entity

    attributes :list_id, :content, :completed
    attr_reader :list

    def list=(list)
      @list = list
      self.list_id = @list.id
    end

    def complete!
      self.completed = true
    end

    def completed?
      completed
    end

    def to_s
      content
    end
  end
end
