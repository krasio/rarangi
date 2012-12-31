require 'rarangi/entities/entry'

module Rarangi
  describe Entry do
    subject { Entry.new('olive oil') }

    describe "initialization" do
      its(:content) {should == 'olive oil'}
    end

    describe "#to_s" do
      its(:to_s) {should == 'olive oil'}
    end
  end
end
