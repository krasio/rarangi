require 'spec_helper'

module Rarangi
  describe CreateEntry do
    describe "#exec" do
      let(:list) { List.new }
      let(:entry) { Entry.new('olive oil')}

      subject { CreateEntry.in_list(list) }

      before { subject.exec(entry) }

      it "adds entry to list" do
        expect(list.entries).to eq([entry])
      end
    end
  end
end
