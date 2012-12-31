module Rarangi
  class Entry
    attr_reader :content

    def initialize(content)
      @content = content
    end

    def to_s
      @content
    end
  end
end
