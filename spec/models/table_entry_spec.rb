require 'rails_helper'

RSpec.describe TableEntry, type: :model do
    it "should be invalid because of duration" do
        entry = FactoryGirl.build(:table_entry, :duration => 0)
        expect(entry).to be_invalid
    end

    it "should be invalid because of duration" do
        entry = FactoryGirl.build(:table_entry, :duration => 25)
        expect(entry).to be_invalid
    end

    it "should be invalid because of duration" do
        entry = FactoryGirl.build(:table_entry, :duration => 'eight.0')
        expect(entry).to be_invalid
    end

    it "should be invalid because of date" do
        entry = FactoryGirl.build(:table_entry, :date => nil)
        expect(entry).to be_invalid
    end
end
