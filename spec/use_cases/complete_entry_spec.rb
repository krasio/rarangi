require 'spec_helper'

module Rarangi
  describe CompleteEntry do
    describe "#exec" do
      let(:list) do
        list = Rarangi::List.new
        Repository.lists.create(list)
        list
      end
      let(:entry) { Rarangi::Entry.new(content: "olive oil") }

      subject do
        CreateEntry.for_list(list).exec(entry)
        described_class.new(entry)
      end

      before { subject.exec }

      it "marks entry as completed" do
        expect(entry).to be_completed
      end
    end
  end
end
