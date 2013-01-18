module Rarangi
  module Memory
    class UserMapper < Minimapper::Memory
      def find_by_email(email)
        user = all.find {|u| u.email == email}
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
end
