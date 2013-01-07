module Rarangi
  module Mapper
    class AR < Minimapper::AR
      def entity_class
        @entity_class ||= ("Rarangi::" + self.class.name.split('::').last.gsub(/Mapper/, '')).constantize
        @entity_class
      end
    end
  end
end
