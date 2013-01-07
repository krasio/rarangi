module Rarangi
  class User
    include Minimapper::Entity

    attributes :name
    attr_reader :list

    def list=(list)
      list.tap do |l|
        l.owner = self
        @list = list
      end
    end
  end
end
