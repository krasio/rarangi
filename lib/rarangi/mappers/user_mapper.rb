module Rarangi
  class UserMapper < Minimapper::Memory
    def find_by_name(name)
      user = all.find {|u| u.name == name}
      set_list(user)
    end

    def find(id)
      user = super(id)
      set_list(user)
    end

    def set_list(user)
      if user
        user.list = Repository.lists.find_by_owner_id(user.id)
      end

      return user
    end
  end
end
