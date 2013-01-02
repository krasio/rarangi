require 'spec_helper'

module Rarangi
  describe CreateEntry do
    describe "#exec" do
      let(:list) do
        list = Rarangi::List.new
        Repository.lists.create(list)
        list
      end

      let(:entry) { Entry.new(content: 'olive oil')}

      subject { CreateEntry.for_list(list) }

      before { subject.exec(entry) }

      it "adds entry to list" do
        l = Repository.lists.find(list.id)
        expect(l.entries.map(&:id)).to include(entry.id)
      end

      it "sets list for entry" do
        expect(entry.list).to eq(list)
      end
    end
  end
end
