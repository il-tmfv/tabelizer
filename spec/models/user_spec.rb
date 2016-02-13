require 'rails_helper'

RSpec.describe User, type: :model do
    it "create Bob by default" do
       user = FactoryGirl.build(:user)
       expect(user.first_name).to eq('Bob')
    end

    it "check if first_name is empty" do
        user = FactoryGirl.build(:user, :first_name => '')
        expect(user).to be_invalid
    end

    it "check if last_name is empty" do
        user = FactoryGirl.build(:user, :last_name => '')
        expect(user).to be_invalid
    end

    it "check if position is empty" do
        user = FactoryGirl.build(:user, :position => '')
        expect(user).to be_invalid
    end
end
