module Rarangi
  class User
    include Minimapper::Entity

    attributes :email, :name
    attr_reader :list

    validates :email, presence: true, format: { with: %r/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

    def list=(list)
      list.owner = self
      @list = list
    end
  end
end
