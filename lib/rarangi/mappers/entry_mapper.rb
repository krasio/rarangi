module Rarangi
  class EntryMapper < Minimapper::Memory
    def find_by_list_id(list_id)
      all.select {|e| e.id == list_id}
    end
  end
end
