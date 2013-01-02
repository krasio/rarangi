require 'spec_helper'

module Rarangi
  describe CreateUser do
    describe "#exec" do
      before { subject.exec('krasio') }

      let(:new_user) { Repository.users.find_by_name('krasio') }

      it "creates new user" do
        expect(new_user).to be_persisted
      end

      it "creates list for the new user" do
        list = new_user.list
        expect(list).to be_persisted
      end
    end
  end
end
