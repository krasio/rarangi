module Minimapper
  class AR
    def entity_class
      @entity_class ||= ("Rarangi::" + self.class.name.split('::').last.gsub(/Mapper/, '')).constantize
      @entity_class
    end
  end
end
