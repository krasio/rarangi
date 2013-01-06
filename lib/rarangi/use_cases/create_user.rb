module Rarangi
  class CreateUser
    def exec(name)
      user = User.new(name: name)
      Repository.users.create(user)
      assign_list(user)

      return user
    end

    def assign_list(user)
      list = List.new.tap do |l|
        l.owner = user
      end
      Repository.lists.create(list)
      user.list = list
    end
  end
end
