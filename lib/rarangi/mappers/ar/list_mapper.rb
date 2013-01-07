module Rarangi
  module AR
    class List < ActiveRecord::Base
    end

    class ListMapper < Mapper::AR
      def find(id)
        list = super(id)
        set_entries(list)
      end

      def find_by_owner_id(owner_id)
        list = entity_for(record_klass.find_by_owner_id(owner_id))
        set_entries(list)
      end

      private

      def set_entries(list)
        if list
          Repository.entries.find_by_list_id(list.id).each {|e| list << e}
        end

        return list
      end
    end
  end
end
