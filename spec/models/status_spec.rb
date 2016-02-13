require 'rails_helper'

RSpec.describe Status, type: :model do
    it "should be valid" do
        status = FactoryGirl.build(:status)
        expect(status).to be_valid
    end

    it "should not be valid" do
        status =  FactoryGirl.build(:status, :text => 'NA')
        expect(status).to be_invalid
    end

    it "should has unique text" do
        status = FactoryGirl.create(:status)
        status2 = FactoryGirl.build(:status)
        expect(status2).to be_invalid
    end

    it "should has unique text" do 
        status = FactoryGirl.create(:status)
        status2 = FactoryGirl.build(:status, :text => 'Something')
        expect(status2).to be_valid
    end
end
