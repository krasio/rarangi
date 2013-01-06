module Rarangi
  module AR
    class Entry < ActiveRecord::Base
    end

    class EntryMapper < Minimapper::AR
      def find_by_list_id(list_id)
        (record_klass.find_all_by_list_id(list_id) || []).map do |r|
          entity_for(r)
        end
      end
    end
  end
end
