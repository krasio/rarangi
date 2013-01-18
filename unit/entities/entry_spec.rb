require_relative '../unit_helper'
require 'rarangi/entities/entry'

module Rarangi
  describe Entry do
    subject { Entry.new(content: 'olive oil') }

    describe "#to_s" do
      its(:to_s) { should == 'olive oil' }
    end

    describe "#completed?" do
      it { should_not be_completed }

      it "knows when it's completed" do
        subject.completed = true
        expect(subject).to be_completed
      end
    end

    describe "#complete!" do
      before { subject.complete! }

      it { should be_completed }
    end
  end
end
