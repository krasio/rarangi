require 'spec_helper'

module Rarangi
  describe List do
    context "new list" do
      it {should be_empty}
      it {should have(0).entries}
    end

    context "in general" do
      describe "#<<" do
        let(:entry) { double }
        before { subject << entry }

        its(:entries) {should == [entry]}
      end

      describe "#empty?" do
        context "when entries" do
          before { subject << double }

          it {should_not be_empty}
        end

        context "when no entries" do
          it {should be_empty}
        end
      end

      describe "#size" do
        context "when entries" do
          before do
            subject << double
            subject << double
          end

          its(:size) {should == 2}
        end

        context "when no entries" do
          its(:size) {should == 0}
        end
      end
    end
  end
end
