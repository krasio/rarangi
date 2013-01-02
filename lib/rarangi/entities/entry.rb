module Rarangi
  class Entry
    include Minimapper::Entity

    attributes :list_id, :content
    attr_reader :list

    def list=(list)
      @list = list
      self.list_id = @list.id
    end

    def to_s
      content
    end
  end
end
