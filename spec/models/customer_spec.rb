require 'rails_helper'

RSpec.describe Customer, type: :model do
    it "should be valid" do
        customer = FactoryGirl.build(:customer)
        expect(customer).to be_valid
    end

    it "should not be valid" do
        customer = FactoryGirl.build(:customer, :title => 'NA')
        expect(customer).to be_invalid
    end

    it "should has unique title" do
        customer = FactoryGirl.create(:customer, :title => 'test')
        customer2 = FactoryGirl.build(:customer, :title => 'test')
        expect(customer2).to be_invalid
    end

    it "should has unique title" do 
        customer = FactoryGirl.create(:customer)
        customer2 = FactoryGirl.build(:customer, :title => 'SomeoneElse')
        expect(customer2).to be_valid
    end
end
