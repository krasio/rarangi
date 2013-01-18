require_relative '../unit_helper'
require "rarangi/entities/user"

module Rarangi
  describe User do
    context "in general" do
      let(:list) { Struct.new(:owner).new }

      describe "#list=" do
        subject { User.new(id: 23) }

        before do
          list.should_receive(:owner=).with(subject)
          subject.list = list
        end

        its(:list) {should == list}
      end
    end

    context "validations" do
      it { should validate_presence_of(:email) }
      it { should_not allow_value("blah").for(:email) }
      it { should allow_value("a@b.com").for(:email) }
    end
  end
end
