module Rarangi
  class ListMapper < Minimapper::Memory
    def find(id)
      if list = super(id)
        Repository.entries.find_by_list_id(list.id).each {|e| list << e}
      end

      list
    end
  end
end
