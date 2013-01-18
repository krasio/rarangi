require_relative '../unit_helper'
require 'rarangi/entities/list'

module Rarangi
  describe List do
    context "new list" do
      it {should be_empty}
      it {should have(0).entries}
    end

    context "in general" do
      let(:entry) { Struct.new(:list).new }

      context "#owner=" do
        let(:user) { double(id: 23) }

        before { subject.owner = user }

        its(:owner_id) {should == user.id}
        its(:owner) {should == user}
      end

      describe "#<<" do
        subject { List.new(id: 23) }

        before do
          entry.should_receive(:list=).with(subject)
          subject << entry
        end

        its(:entries) {should == [entry]}
      end

      describe "#empty?" do
        context "when entries" do
          before { subject << entry }

          it {should_not be_empty}
        end

        context "when no entries" do
          it {should be_empty}
        end
      end

      describe "#size" do
        context "when entries" do
          before do
            subject << entry
            subject << entry
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
