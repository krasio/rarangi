require "minimapper"
require "minimapper/entity"
require "minimapper/memory"

require 'rarangi/entities/entry'

module Rarangi
  describe Entry do
    subject { Entry.new(content: 'olive oil') }

    describe "#to_s" do
      its(:to_s) {should == 'olive oil'}
    end
  end
end
