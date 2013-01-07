module Rarangi
  class CompleteEntry
    def initialize(entry)
      @entry = entry
    end

    def exec
      @entry.complete!
      Repository.entries.update(@entry)
    end
  end
end
