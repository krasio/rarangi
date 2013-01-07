require "minimapper"
require "minimapper/entity"
require "minimapper/memory"

require 'rarangi/entities/user'

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
  end
end
