module Rarangi
  class User
    include Minimapper::Entity

    attributes :name
    attr_accessor :list
  end
end
