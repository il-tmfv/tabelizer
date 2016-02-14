require 'rails_helper'

RSpec.describe Assignment, type: :model do
    it "should be valid" do
        assignment = FactoryGirl.build(:assignment)
        expect(assignment).to be_valid
    end

    it "should be invalid" do
        assignment = FactoryGirl.build(:assignment, :date => nil)
        expect(assignment).to be_invalid
    end
end
