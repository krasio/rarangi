module Rarangi
  class CreateUser
    def exec(name)
      user = User.new(name: name)
      Repository.users.create(user)
      assign_list(user)

      return user
    end

    def assign_list(user)
      list = List.new
      user.list = list
      Repository.lists.create(list)
    end
  end
end
