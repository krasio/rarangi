module Rarangi
  class CreateUser
    def self.exec(email)
      self.new.exec(email)
    end

    def exec(email)
      user = User.new(email: email)
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
