module Rarangi
  module AR
    class User < ActiveRecord::Base
    end

    class UserMapper < Mapper::AR
      def find_by_email(email)
        user = entity_for(record_klass.find_by_email(email))
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
